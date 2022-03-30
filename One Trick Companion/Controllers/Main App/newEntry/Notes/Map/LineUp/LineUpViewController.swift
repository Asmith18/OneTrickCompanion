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
    
    var viewModel: LineUpViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleTextField.text = viewModel?.lineup?.title
        instructionTextView.text = viewModel?.lineup?.instructions
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = overviewTableView.dequeueReusableCell(withIdentifier: "overviewCell", for: indexPath) as? LineUpTableViewCell else { return UITableViewCell() }
        
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
        
    }
}
