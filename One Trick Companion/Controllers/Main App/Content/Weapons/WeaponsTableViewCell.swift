//
//  WeaponsTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class WeaponsTableViewCell: UITableViewCell {

//MARK: - Outlets
    @IBOutlet weak var gunNameTextLabel: UILabel!
    @IBOutlet weak var gunImageView: MapImageView!
    @IBOutlet weak var fireRateTextLabel: UILabel!
    @IBOutlet weak var magSizeTextLabel: UILabel!
    @IBOutlet weak var fbaTextLabel: UILabel!
    @IBOutlet weak var stat1TextLabel: UILabel!
    @IBOutlet weak var stat2TextLabel: UILabel!
    @IBOutlet weak var stat3TextLabel: UILabel!
    
    var viewModel: WeaponsViewModel!
    
    override func prepareForReuse() {
        gunNameTextLabel.text = ""
        gunImageView.image = nil
        stat1TextLabel.text = "0"
        stat2TextLabel.text = "0"
        stat3TextLabel.text = "0"
    }
    
    func updateViews(weapon: WeaponsData) {
        gunImageView.setImage(using: weapon.displayIcon)
        gunNameTextLabel.text = weapon.displayName
        guard let weaponStats = weapon.weaponStats else { return }
        stat1TextLabel.text = "\(weaponStats.fireRate)"
        stat2TextLabel.text = "\(weaponStats.magazineSize)"
        stat3TextLabel.text  = "\(weaponStats.firstBulletAccuracy)"
    }
}
