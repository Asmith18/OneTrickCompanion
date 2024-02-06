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
    
    
    func updateViews(for player: Player) {
        // Ensure all required properties are available
        guard let position = player.leaderboardRank,
              let gamesWon = player.numberOfWins,
              let rankRating = player.rankedRating else {
            return // Exit if any of these properties are nil
        }

        // Check if playerName exists and is not empty, otherwise use "Secret Agent"
        let playerName = player.gameName?.isEmpty ?? true ? "Secret Agent" : player.gameName!
        
        // Update UI elements directly with unwrapped values
        PlayerNameText.text = "\(playerName)"
        positionLabel.text = "\(position)"
        gamesWonLabel.text = "\(gamesWon) Games Won"
        rankRatingLAbel.text = "\(rankRating)"
        updateRankRatingLogo(for: player)
    }
    
    func updateRankRatingLogo(for player: Player) {
        // Simplify rank image assignment using a switch statement
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
