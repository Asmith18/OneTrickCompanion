//
//  LineUpViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class LineUpViewController: UIViewController {
    
    //MARK: - Outputs
    @IBOutlet weak var instructionTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ImagesCollectionView: UICollectionView!
    @IBOutlet weak var agentImageView: MapImageView!
    @IBOutlet weak var textFieldView: UIView!
    
    var viewModel: LineUpViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lineup"
        ImagesCollectionView.dataSource = self
        ImagesCollectionView.delegate = self
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDetailScreen()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func setupDetailScreen() {
        textFieldView.layer.cornerRadius = 12
        instructionTextView.text = viewModel.lineup?.instructions ?? ""
        titleTextField.text = viewModel.lineup?.title ?? ""
        agentImageView.setImage(using: viewModel.lineup?.agentImage ?? viewModel.agent?.displayIconSmall)
        instructionTextView.layer.cornerRadius = 10
        ImagesCollectionView.layer.cornerRadius = 10
        agentImageView.layer.cornerRadius = agentImageView.frame.size.width / 2
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let instructions = instructionTextView.text,
              let title = titleTextField.text else { return }
        
        if title.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please enter a title.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        viewModel?.saveLineup(instructions: instructions, title: title)
        
        if let lineupListViewController = navigationController?.viewControllers.first(where: { $0 is LineupListTableViewController }) {
            navigationController?.popToViewController(lineupListViewController, animated: true)
        }
    }
    
    @IBAction func addImagesButtontapped(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

extension LineUpViewController: UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.tempArray.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImagesCollectionView.dequeueReusableCell(withReuseIdentifier: "overviewCell", for: indexPath) as! LineupCollectionViewCell
        let result = viewModel?.tempArray[indexPath.row]
        cell.updateViews(image: result!)
        return cell
    }
}

extension LineUpViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            viewModel?.tempArray.append(image)
            DispatchQueue.main.async {
                self.ImagesCollectionView.reloadData()
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
