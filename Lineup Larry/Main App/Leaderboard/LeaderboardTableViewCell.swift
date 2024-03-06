//
//  LeaderboardTableViewCell.swift
//  Lineup Larry
//
//  Created by Adam Smith on 1/11/24.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var rankImageView: UIImageView!
    @IBOutlet weak var PlayerNameText: UILabel!
    @IBOutlet weak var gamesWonLabel: UILabel!
    @IBOutlet weak var rankRatingLAbel: UILabel!
    
    
    func updateViews(for player: Player) {
        guard let position = player.leaderboardRank,
              let gamesWon = player.numberOfWins,
              let rankRating = player.rankedRating else {
            return
        }
        let playerName = player.gameName?.isEmpty ?? true ? "Secret Agent" : player.gameName!
    
        PlayerNameText.text = "\(playerName)"
        positionLabel.text = "\(position)"
        gamesWonLabel.text = "\(gamesWon) Games Won"
        rankRatingLAbel.text = "\(rankRating)"
        updateRankRatingLogo(for: player)
    }
    
    func updateRankRatingLogo(for player: Player) {
        let imageName: String
        switch player.competitiveTier {
        case 27:
            imageName = "RadiantRank"
        case 26:
            imageName = "Immortal3"
        case 25:
            imageName = "Immortal2"
        default:
            imageName = "Immortal1"
        }
        rankImageView.image = UIImage(named: imageName)
    }
}
