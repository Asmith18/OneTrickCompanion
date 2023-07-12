//
//  UserImagesCollectionViewCell.swift
//  Lineup Larry
//
//  Created by Adam Smith on 7/11/23.
//

import UIKit

class UserImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var overViewImages: UIImageView!
    
    func updateViews(image: UIImage) {
        overViewImages?.image = image
        overViewImages?.layer.cornerRadius = 10
    }
}
