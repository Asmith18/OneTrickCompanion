//
//  MapsTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class MapsTableViewCell: UITableViewCell {

//MARK: - Outlets
    @IBOutlet weak var mapnameTextLabel: UILabel!
    @IBOutlet weak var maocoordinatesTextLabel: UILabel!
    @IBOutlet weak var mapImageView: MapImageView!
    
    var viewModel: MapsViewModel!
    
    func updateViews(maps: MapData) {
        mapnameTextLabel.text = maps.displayName
        mapImageView.setImage(using: maps.listViewIcon)
    }
}
