//
//  AgentAbilitiesTableViewCell.swift
//  Lineup Larry
//
//  Created by Adam Smith on 7/5/23.
//

import UIKit

class AgentAbilitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var abilitiesImageView: MapImageView!
    @IBOutlet weak var abilitiesNameLabel: UILabel!
    private var descriptionLabel: UILabel?
    @IBOutlet weak var dropDownImage: MapImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDescriptionLabel()
    }
    
    private func setupDescriptionLabel() {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: abilitiesNameLabel.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
        
        self.descriptionLabel = label
    }
    
    func updateViews(ability: AgentAbilities) {
        abilitiesNameLabel.text = ability.displayName
        abilitiesImageView.setImage(using: ability.displayIcon)
        
        descriptionLabel?.text = ability.description
        descriptionLabel?.isHidden = !(ability.isExpanded ?? false)
        
        let stateImage = ability.isExpanded ?? false ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
        dropDownImage.image = stateImage
    }
}
