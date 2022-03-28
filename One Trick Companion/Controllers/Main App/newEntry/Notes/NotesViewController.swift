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
        title = "Select Agent"
        setupTableView()
        viewModel = NoteViewModel(delegate: self)
    }
    
    private func setupTableView() {
        self.notestableView.delegate = self
        self.notestableView.dataSource = self
        self.notestableView.register(AgentTableViewCell.nib(), forCellReuseIdentifier: AgentTableViewCell.reuseID)
        
        self.notestableView.backgroundColor = UIColor(red: 19, green: 32, blue: 45, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.agentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AgentTableViewCell.reuseID, for: indexPath) as? AgentTableViewCell else { return UITableViewCell() }
        let result = viewModel.agentData[indexPath.row]
        cell.updateViews(agent: result)
        cell.selectionStyle = .none
        cell.setNeedsUpdateConstraints() 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toMapSegue", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toMapSegue",
              let destination = segue.destination as? MapTableViewController,
              let selectedRow = notestableView.indexPathForSelectedRow?.row else { return }
        let agent = viewModel.agentData[selectedRow]
        destination.agentData = agent
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
