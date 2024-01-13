//
//  UserImagesCollectionViewCell.swift
//  Lineup Larry
//
//  Created by Adam Smith on 7/11/23.
//

import UIKit

class UserImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var overviewImages: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        overviewImages.contentMode = .scaleAspectFill
        overviewImages.clipsToBounds = true
    }
}
