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
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var agentImageView: MapImageView!
    @IBOutlet weak var roleImageView: MapImageView!
    
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
        agentImageView.layer.cornerRadius = agentImageView.frame.height / 2
        roleImageView.setImage(using: agentRole.displayIcon)
        roleImageView.contentMode = .scaleAspectFit
    }
    
    
}
