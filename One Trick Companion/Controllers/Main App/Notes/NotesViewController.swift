//
//  NotesViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //MARK: - Outlets
    @IBOutlet weak var notestableView: UITableView!
    
    var viewModel: NoteViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.notestableView.delegate = self
        self.notestableView.dataSource = self
        viewModel = NoteViewModel(delegate: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.agentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        let result = viewModel.agentData[indexPath.row]
        cell.textLabel?.text = result.displayName
        
        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toMapSegue",
              let mapTableViewController = segue.destination as? MapTableViewController,
              let selectedRow = notestableView.indexPathForSelectedRow?.row else { return }
        let agent = viewModel.agentData[selectedRow]
        mapTableViewController.agentData = agent
    }
}

extension NotesViewController: NoteViewModelDelegate {
    
    func agentListHasData() {
        DispatchQueue.main.async {
            self.notestableView.reloadData()
        }
    }
    
    func encountered(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [weak self] _ in
            self?.viewModel.fetch()
        }))
        present(alertController, animated: true)
    }
}
