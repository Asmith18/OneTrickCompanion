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
        let fireRate = Int(weaponStats.fireRate * 1)
        let fba = Int(weaponStats.firstBulletAccuracy * 100)
        stat1TextLabel.text = "\(fireRate) Rps"
        stat2TextLabel.text = "\(weaponStats.magazineSize)"
        stat3TextLabel.text  = "\(fba)%"
    }
}
