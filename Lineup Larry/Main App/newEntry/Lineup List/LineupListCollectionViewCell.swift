//
//  LineupListCollectionViewCell.swift
//  Lineup Larry
//
//  Created by Adam Smith on 7/7/23.
//

import UIKit

class LineupListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var agentImageView: MapImageView!
    @IBOutlet weak var agentNameLabel: UILabel!
    @IBOutlet weak var mapLabel: UILabel!
    
    func updateViews(lineup: Lineup) {
        agentImageView.setImage(using: lineup.agentImage)
        agentNameLabel.text = lineup.title
        mapLabel.text = lineup.mapName
    }
    
    
}
