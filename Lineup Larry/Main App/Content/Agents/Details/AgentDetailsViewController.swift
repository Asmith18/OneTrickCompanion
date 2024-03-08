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
    @IBOutlet weak var abillitiesTableView: UITableView!
    @IBOutlet weak var detailsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.agent?.displayName
        abillitiesTableView.dataSource = self
        abillitiesTableView.delegate = self
        updateViews()
    }
    
    func updateViews() {
        guard let agent = viewModel.agent else { return }
        agentImageView.setImage(using: agent.fullPortrait)
        detailsTextView.text = agent.description
        detailsTextView.isEditable = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.agent?.abilities.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "abilities", for: indexPath) as? AgentAbilitiesTableViewCell,
              let ability = viewModel.agent?.abilities[indexPath.row] else { return UITableViewCell() }
        cell.updateViews(ability: ability)
        cell.selectionStyle = .none
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isExpanded = viewModel.agent?.abilities[indexPath.row].isExpanded {
            viewModel.agent?.abilities[indexPath.row].isExpanded = !isExpanded
        } else {
            viewModel.agent?.abilities[indexPath.row].isExpanded = true
        }
        abillitiesTableView.beginUpdates()
        abillitiesTableView.reloadRows(at: [indexPath], with: .automatic)
        abillitiesTableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let isExpanded = viewModel.agent?.abilities[indexPath.row].isExpanded, isExpanded {
            return 250
        } else {
            return 70
        }
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
