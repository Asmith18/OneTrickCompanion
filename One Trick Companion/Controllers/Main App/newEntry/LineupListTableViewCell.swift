//
//  NewEntryTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/26/22.
//

import UIKit

class LineupListTableViewCell: UITableViewCell {

    var agentData: AgentData?
    
  //MARK: - Outlets
    @IBOutlet weak var entryTitleTextLabel: UILabel!
    @IBOutlet weak var agentImageView: MapImageView!
    @IBOutlet weak var mapNameTextLabel: UILabel!
    
    func updateViews(lineup: Lineup) {
        entryTitleTextLabel.text = lineup.title
        agentImageView.setImage(using: lineup.agentImage)
        mapNameTextLabel.text = lineup.mapName
    }
    
    func fetchImage() {
        
    }
}
