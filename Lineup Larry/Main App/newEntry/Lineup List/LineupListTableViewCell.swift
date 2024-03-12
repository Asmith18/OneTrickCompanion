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
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
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
        agentImageView.layer.borderWidth = 1
        agentImageView.layer.borderColor = UIColor.gray.cgColor
        descriptionTextView.text = lineup.instructions
        descriptionTextView.layer.cornerRadius = 12
        agentImageView.layer.cornerRadius = agentImageView.frame.size.width / 2
        minipulateTextField()
        imagesCollectionView.reloadData()
    }
    
    func minipulateTextField() {
        if descriptionTextView.text == "" {
            bottomView.isHidden = true
        } else {
            bottomView.isHidden = false
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lineup.overviewImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "overviewImages", for: indexPath) as? UserImagesCollectionViewCell else {
            return UICollectionViewCell() }
        let imageData = lineup.overviewImages[indexPath.row]
        if let image = UIImage(data: imageData) {
            cell.overviewImages.image = image
        }
        let imageCount = lineup.overviewImages.count
        pageControl.numberOfPages = imageCount
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellHeight = imagesCollectionView.bounds.height
        return CGSize(width: screenWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

