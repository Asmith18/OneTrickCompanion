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
        title = "Create Lineup"
        ImagesCollectionView.dataSource = self
        ImagesCollectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        ImagesCollectionView.collectionViewLayout = layout
        ImagesCollectionView.showsHorizontalScrollIndicator = false
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDetailScreen()
        navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func setupDetailScreen() {
        instructionTextView.text = viewModel.lineup?.instructions ?? ""
        titleTextField.text = viewModel.lineup?.title ?? ""
        agentImageView.setImage(using: viewModel.lineup?.agentImage ?? viewModel.agent?.displayIconSmall)
        textFieldView.layer.cornerRadius = 12
        titleTextField.clipsToBounds = true
        instructionTextView.layer.cornerRadius = 12
        ImagesCollectionView.layer.cornerRadius = 12
        agentImageView.layer.cornerRadius = agentImageView.frame.size.width / 2
    }
    
    func deleteImage(at indexPath: IndexPath) {
        viewModel.tempArray.remove(at: indexPath.item)
        ImagesCollectionView.deleteItems(at: [indexPath])
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let instructions = instructionTextView.text,
              let title = titleTextField.text else { return }
        
        if title.isEmpty || viewModel.tempArray.isEmpty {
                var message = ""
                if title.isEmpty {
                    message = "Please enter a title."
                } else if viewModel.tempArray.isEmpty {
                    message = "Please add an Image to save a lineup."
                }
                
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
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

extension LineUpViewController: UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.tempArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImagesCollectionView.dequeueReusableCell(withReuseIdentifier: "overviewCell", for: indexPath) as! LineupCollectionViewCell
        let image = viewModel.tempArray[indexPath.row]
        cell.updateViews(image: image)
        cell.deleteButtonAction = { [weak self] in
            if let cellIndexPath = collectionView.indexPath(for: cell) {
                let alertController = UIAlertController(title: "Delete Image", message: "Are you sure you want to remove this image?", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Yes", style: .default) { _ in
                    self?.deleteImage(at: cellIndexPath)
                }
                let alertAction2 = UIAlertAction(title: "No", style: .cancel)
                alertController.addAction(alertAction)
                alertController.addAction(alertAction2)
                self?.present(alertController, animated: true)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = ImagesCollectionView.bounds.width
        let cellHeight = ImagesCollectionView.bounds.height
        return CGSize(width: screenWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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

extension LineUpViewController: LineUpViewModelDelegate {
    func overviewImagesHasdata() {
        DispatchQueue.main.async {
            self.ImagesCollectionView.reloadData()
        }
    }
    
    func encountered(_ error: Error) {
        print(error)
    }
}
