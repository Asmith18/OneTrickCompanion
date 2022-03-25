//
//  MapTableViewCell.swift
//  One Trick Companion
//
//  Created by Trevor Walker on 3/24/22.
//

import UIKit

class MapTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: MapImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fadeView: GradientView!
    @IBOutlet weak var coordLabel: UILabel!
    
    static let reuseId = "mapCell"
    static func nib() -> UINib {
        return UINib(nibName: "MapTableViewCell", bundle: Bundle(for: self))
    }
    
    func updateView(_ map: MapData) {
        backgroundImage.setImage(using: map.splash)
        nameLabel.text = map.displayName
        self.coordLabel.text = map.coordinates
    }
}
