//
//  AgentsTableViewCell.swift
//  Lineup Larry
//
//  Created by Adam Smith on 6/28/23.
//

import UIKit

class AgentsTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var agentNameTextLabel: UILabel!
    @IBOutlet weak var agentImageView: MapImageView!
    @IBOutlet weak var roleImageView: MapImageView!
    @IBOutlet weak var roleLabel: UILabel!
    
    static let reuseID = "agentCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "AgentTableViewCell", bundle: Bundle(for: self))
    }
    
    override func prepareForReuse() {
        agentNameTextLabel.text = ""
        roleLabel.text = ""
        agentImageView.image = nil
        roleImageView.image = nil
    }
    
    func updateViews(agent: AgentData) {
        guard let agentRole = agent.role else { return }
        agentNameTextLabel.text = agent.displayName
        roleLabel.text = agentRole.displayName
        agentImageView.setImage(using: agent.displayIcon)
        agentImageView.contentMode = .scaleAspectFit
        agentImageView.layer.cornerRadius = agentImageView.frame.width / 2
        roleImageView.setImage(using: agentRole.displayIcon)
        roleImageView.contentMode = .scaleAspectFit
    }
}
