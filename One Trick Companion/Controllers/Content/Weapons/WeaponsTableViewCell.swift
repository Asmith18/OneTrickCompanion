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
    
    func updateViews(weapon: WeaponsData) {
        guard let weaponStats = weapon.weaponStats else { return }
        gunNameTextLabel.text = weapon.displayName
        fireRateTextLabel.text = "\(weaponStats.fireRate)"
        magSizeTextLabel.text = "\(weaponStats.magazineSize)"
        fbaTextLabel.text = "\(weaponStats.firstBulletAccuracy)"
        fetchImage(with: weapon.displayIcon)
    }
    
    func fetchImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        gunImageView.setImage(using: url)
    }
}
