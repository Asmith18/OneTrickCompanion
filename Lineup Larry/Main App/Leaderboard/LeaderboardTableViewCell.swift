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
    @IBOutlet weak var rankRatingLAbel: UILabel!
    

    func updateViews(player: Player) {
        positionLabel.text = "\(player.leaderboardRank ?? 0)"
        PlayerNameText.text = player.gameName
        gamesWonLabel.text = "\(player.numberOfWins ?? 0) Games Won"
        rankRatingLAbel.text = "\(player.rankedRating)"
        if player.competitiveTier == 27 {
            rankImageView.image = UIImage(named: "RadiantRank")
        } else if player.competitiveTier == 26 {
            rankImageView.image = UIImage(named: "Immortal3")
        } else if player.competitiveTier == 25 {
            rankImageView.image = UIImage(named: "Immortal2")
        } else {
            rankImageView.image = UIImage(named: "Immortal1")
        }
    }
}
