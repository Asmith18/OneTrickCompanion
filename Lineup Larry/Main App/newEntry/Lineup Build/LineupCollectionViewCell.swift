//
//  LineupCollectionViewCell.swift
//  Lineup Larry
//
//  Created by adam smith on 11/15/22.
//

import UIKit

class LineupCollectionViewCell: UICollectionViewCell {
    
    var deleteButtonAction: (() -> Void)?
    
    @IBOutlet weak var lineupImageView: UIImageView!
    @IBOutlet weak var deleteImageButton: UIButton!
    
    func updateViews(image: UIImage) {
        lineupImageView?.image = image
//        deleteImageButton.setTitle("", for: .normal)
        lineupImageView.contentMode = .scaleAspectFill
        lineupImageView.clipsToBounds = true
    }
    
    @IBAction func deleteImageButtonTapped(_ sender: Any) {
        deleteButtonAction?()
    }
}
