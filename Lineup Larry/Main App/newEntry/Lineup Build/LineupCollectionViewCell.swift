//
//  LineupCollectionViewCell.swift
//  Lineup Larry
//
//  Created by adam smith on 11/15/22.
//

import UIKit

class LineupCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lineupImageView: UIImageView!
    
    func updateViews(image: UIImage) {
        lineupImageView?.image = image
    }
}
