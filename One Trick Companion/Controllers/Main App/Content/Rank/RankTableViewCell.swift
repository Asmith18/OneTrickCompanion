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
        fetchRank1(with: smallIcon)
        fetchRank2(with: smallIcon)
        fetchRank3(with: smallIcon)
    }
    
    func fetchRank1(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        rank1ImageView.setImage(using: url)
    }
    
    func fetchRank2(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        rank2ImageView.setImage(using: url)
    }
    
    func fetchRank3(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        rank3imageView.setImage(using: url)
    }

}
