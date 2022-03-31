//
//  LineUpTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/26/22.
//

import UIKit

class LineUpTableViewCell: UITableViewCell {

    //MARK: - Outputs
    @IBOutlet weak var customImage: UIImageView!
    
    
    func updateViews(image: UIImage) {
        customImage.image = image
    }
}
