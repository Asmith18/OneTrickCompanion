//
//  NewEntryTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/26/22.
//

import UIKit

class NewEntryTableViewCell: UITableViewCell {

  //MARK: - Outlets
    @IBOutlet weak var entryTitleTextLabel: UILabel!
    @IBOutlet weak var agentImageView: UIImageView!
    @IBOutlet weak var mapNameTextLabel: UILabel!
    
    func updateViews(lineup: Lineup) {
        entryTitleTextLabel.text = lineup.title
//        agentImageView.image = lineup.agentImage
        mapNameTextLabel.text = lineup.mapName
    }
    
//    fetch the agent image
}
