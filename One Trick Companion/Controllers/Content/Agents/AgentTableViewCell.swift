//
//  AgentTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/21/22.
//

import UIKit

class AgentTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var agentNameTextLabel: UILabel!
    @IBOutlet weak var agentImageView: MapImageView!
    @IBOutlet weak var roleImageView: MapImageView!
    
    var viewModel: AgentViewModel!
    var abilities: [AgentAbilities] = []
    
    func updateViews(agent: AgentData) {
        guard let agentRole = agent.role else { return }
        agentNameTextLabel.text = agent.displayName
        fetchAgentImage(with: agent.displayIconSmall)
        fetchRoleImage(with: agentRole.displayIcon)
    }
    
    func fetchAgentImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        agentImageView.setImage(using: url)
    }
    
    func fetchRoleImage (with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        roleImageView.setImage(using: url)
    }

}
