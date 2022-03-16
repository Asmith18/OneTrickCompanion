//
//  LeaderboardTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

//MARK: - Outlets
    @IBOutlet weak var leaderboardRankTextLabel: UILabel!
    @IBOutlet weak var agentNameTextlabel: UILabel!
    @IBOutlet weak var rankedRatingTextLabel: UILabel!
    @IBOutlet weak var rankTextLabel: UILabel!
    
    func updateViews(leaderboard: LeaderboardData) {
        leaderboardRankTextLabel.text = "\(leaderboard.leaderboardRank ?? 0)"
        agentNameTextlabel.text = leaderboard.gameName
        rankedRatingTextLabel.text = "\(leaderboard.rankedRating ?? 0)"
        rankTextLabel.text = "\(leaderboard.numberOfWins ?? 0)"
    }
}
