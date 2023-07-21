//
//  NewEntryTableViewCell.swift
//  One Trick Companion
//
//  Created by adam smith on 3/26/22.
//

import UIKit
import Foundation

class LineupListTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var lineup: Lineup!
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var agentImageView: MapImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        imagesCollectionView.collectionViewLayout = layout
    }
    
    func configure(with lineup: Lineup) {
        self.lineup = lineup
        titleLabel.text = lineup.title
        mapLabel.text = lineup.mapName
        agentImageView.setImage(using: lineup.agentImage)
        agentImageView.layer.cornerRadius = agentImageView.frame.size.width / 2
        imagesCollectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lineup.overviewImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "overviewImages", for: indexPath) as? UserImagesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let imageData = lineup.overviewImages[indexPath.row]
        if let image = UIImage(data: imageData) {
            cell.overviewImages.image = image
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight = imagesCollectionView.bounds.height
        return CGSize(width: screenWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

