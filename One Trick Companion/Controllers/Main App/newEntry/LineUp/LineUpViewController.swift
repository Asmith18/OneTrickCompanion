//
//  LineUpViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class LineUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //MARK: - Outputs
    @IBOutlet weak var overviewTableView: UITableView!
    @IBOutlet weak var instructionTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var viewModel: LineUpViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.overviewTableView.dataSource = self
        self.overviewTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleTextField.text = viewModel?.lineup?.title
        instructionTextView.text = viewModel?.lineup?.instructions
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.tempArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = overviewTableView.dequeueReusableCell(withIdentifier: "overviewCell", for: indexPath) as? LineUpTableViewCell else { return UITableViewCell() }
        let result = viewModel?.tempArray[indexPath.row]
        cell.updateViews(image: result!)
        return cell
    }
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let instructions = instructionTextView.text,
              let title = titleTextField.text else { return }
        viewModel?.saveLineup(instructions: instructions, title: title)
        for viewController in navigationController!.viewControllers as Array {
            if viewController.isKind(of: LineupListTableViewController.self) {
                navigationController?.popToViewController(viewController, animated: true)
            }
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

extension LineUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            viewModel?.tempArray.append(image)
            DispatchQueue.main.async {
                self.overviewTableView.reloadData()
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
