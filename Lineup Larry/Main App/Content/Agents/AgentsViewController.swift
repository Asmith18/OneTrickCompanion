//
//  AgentsViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/21/22.
//

import UIKit

class AgentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//MARK: - Outlets
    @IBOutlet weak var agentTableView: UITableView!
    
    var viewModel: AgentViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel = AgentViewModel(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func setupTableView() {
        self.agentTableView.dataSource = self
        self.agentTableView.delegate = self
        self.agentTableView.register(AgentsTableViewCell.nib(), forCellReuseIdentifier: AgentsTableViewCell.reuseID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.agentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AgentsTableViewCell.reuseID, for: indexPath) as? AgentsTableViewCell else { return UITableViewCell() }
        let result = viewModel.agentData[indexPath.row]
        cell.updateViews(agent: result)
        cell.selectionStyle = .none
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension AgentsViewController: AgentViewModelDelegate {
    
    func agentListHasData() {
        DispatchQueue.main.async {
            self.agentTableView.reloadData()
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

