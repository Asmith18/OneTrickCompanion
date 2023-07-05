//
//  AgentDetailsViewController.swift
//  Lineup Larry
//
//  Created by Adam Smith on 6/29/23.
//

import UIKit
import Foundation

class AgentDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: AgentDetailsViewModel!
    
    @IBOutlet weak var agentImageView: MapImageView!
    @IBOutlet weak var agenNameLabel: UILabel!
    @IBOutlet weak var abillitiesTableView: UITableView!
    @IBOutlet weak var detailsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        abillitiesTableView.dataSource = self
        abillitiesTableView.delegate = self
        updateViews()
    }
    
    func updateViews() {
        guard let agent = viewModel.agent else { return }
        agentImageView.setImage(using: agent.fullPortrait)
        agenNameLabel.text = agent.displayName
        detailsTextView.text = agent.description
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.abilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "abilities", for: indexPath) as? AgentAbilitiesTableViewCell else { return UITableViewCell() }
        let result = viewModel.abilities[indexPath.row]
        cell.updateViews(ability: result)
        return cell
    }
}

extension AgentDetailsViewController: AgentDetailsViewModelDelegate {
    
    func abilitiesHasData() {
        DispatchQueue.main.async {
            self.abillitiesTableView.reloadData()
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
