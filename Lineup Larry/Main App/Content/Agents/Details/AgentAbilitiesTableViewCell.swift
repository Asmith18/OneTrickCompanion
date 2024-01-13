//
//  AgentAbilitiesTableViewCell.swift
//  Lineup Larry
//
//  Created by Adam Smith on 7/5/23.
//

import UIKit

class AgentAbilitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var abilitiesImageView: MapImageView!
    @IBOutlet weak var abilitiesNameLabel: UILabel!
    
    func updateViews(ability: AgentAbilities) {
        abilitiesNameLabel.text = ability.displayName
        abilitiesImageView.setImage(using: ability.displayIcon)
    }
}
