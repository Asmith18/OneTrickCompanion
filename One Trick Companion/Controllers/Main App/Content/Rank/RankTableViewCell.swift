//
//  RankTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class RankTableViewCell: UITableViewCell {

    //MARK: - outputs
    @IBOutlet weak var rank1TextLabel: UILabel!
    @IBOutlet weak var rank2TextLabel: UILabel!
    @IBOutlet weak var rank3TextLabel: UILabel!
    @IBOutlet weak var rank1ImageView: MapImageView!
    @IBOutlet weak var rank2ImageView: MapImageView!
    @IBOutlet weak var rank3imageView: MapImageView!
    
    
    func updateViews(rank: RanksData) {
        guard let smallIcon = rank.smallIcon else { return }
        rank1TextLabel.text = "\(rank.divisionName)\("1")"
        rank2TextLabel.text = "\(rank.divisionName)\("2")"
        rank3TextLabel.text = "\(rank.divisionName)\("3")"
        rank1ImageView.setImage(using: smallIcon)
        rank2ImageView.setImage(using: smallIcon)
        rank3imageView.setImage(using: smallIcon)
    }

}
