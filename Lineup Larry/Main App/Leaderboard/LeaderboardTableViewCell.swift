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
    

    func updateViews() {
        positionLabel.text = "500"
        PlayerNameText.text = "RazZ"
        gamesWonLabel.text = "500"
    }

}
