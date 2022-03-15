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
    @IBOutlet weak var mapImageView: UIImageView!
    
    func updateViews(maps: MapData) {
        
        self.mapnameTextLabel.text = maps.displayName
        self.maocoordinatesTextLabel.text = maps.coordinates
//        self.mapImageView.image = "\(maps.listViewIcon
    }
    
    func fetchImage(for maps: MapData) {
        
    }
    
}
