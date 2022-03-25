//
//  GameModeTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class GameModeTableViewCell: UITableViewCell {

//MARK: - Outlets
    @IBOutlet weak var gameModeImageView: MapImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var lengthTextLabel: UILabel!
    
    
    func updateViews(mode: GameModeData) {
        guard let gameMode = mode.displayIcon else { return }
        nameTextLabel.text = mode.displayName
        lengthTextLabel.text = mode.duration
        gameModeImageView.setImage(using: gameMode)
    }
}
