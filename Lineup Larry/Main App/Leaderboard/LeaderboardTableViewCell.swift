//
//  LeaderboardTableViewCell.swift
//  Lineup Larry
//
//  Created by Adam Smith on 1/11/24.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    var player: Player?
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var rankImageView: UIImageView!
    @IBOutlet weak var PlayerNameText: UILabel!
    @IBOutlet weak var gamesWonLabel: UILabel!
    

    func updateViews(player: Player) {
        positionLabel.text = "\(player.leaderboardRank)"
        PlayerNameText.text = player.gameName
        gamesWonLabel.text = "\(player.numberOfWins)"
        if player.rankedRating == 27 {
            rankImageView.image = UIImage(named: "RadiantRank")
        } else {
            rankImageView.image = UIImage(named: "RadiantRank")
        }
    }

}
