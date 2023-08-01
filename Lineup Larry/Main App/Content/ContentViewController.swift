//
//  ContentViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit
import SafariServices

class ContentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    let cellLabels = ["Agents", "Maps", "Guns", "TOS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contents"
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        contentCollectionView?.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellLabels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "content", for: indexPath) as? ContentCollectionViewCell else { return  UICollectionViewCell() }
        
        switch indexPath.item {
        case 0:
            cell.cellImageView.layer.cornerRadius = 25
            cell.cellImageView.layer.borderWidth = 1
            cell.cellImageView.layer.borderColor = UIColor.white.cgColor
            cell.cellLabel.text = "Agents"
            cell.cellImageView.image = UIImage(named: "reyna")
            cell.cellImageView.layer.cornerRadius = 25
        case 1:
            cell.cellImageView.layer.cornerRadius = 25
            cell.cellImageView.layer.borderWidth = 1
            cell.cellImageView.layer.borderColor = UIColor.white.cgColor
            cell.cellLabel.text = "Maps"
            cell.cellImageView.image = UIImage(named: "splash")
            cell.cellImageView.layer.cornerRadius = 25
        case 2:
            cell.cellImageView.layer.cornerRadius = 25
            cell.cellImageView.layer.borderWidth = 1
            cell.cellImageView.layer.borderColor = UIColor.white.cgColor
            cell.cellLabel.text = "Guns"
            cell.cellImageView.image = UIImage(named: "reaver")
            cell.cellImageView.layer.cornerRadius = 25
        case 3:
            cell.cellImageView.layer.cornerRadius = 25
            cell.cellImageView.layer.borderWidth = 1
            cell.cellImageView.layer.borderColor = UIColor.white.cgColor
            cell.cellLabel.text = "TOS"
            cell.cellImageView.image = UIImage(named: "TOS")
            cell.cellImageView.layer.cornerRadius = 25
        default:
            cell.cellImageView.image = UIImage(named: "TOS")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let storyboard = UIStoryboard(name: "AgentContent", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "AgentContent") as? AgentsViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let storyboard = UIStoryboard(name: "MapContent", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "MapContent") as? MapsViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let storyboard = UIStoryboard(name: "WeaponContent", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "WeaponContent") as? WeaponsViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        case 3:
            guard let url = URL(string: "https://www.termsfeed.com/live/8f3ca374-a82c-4d9e-a487-c5c35fd6e49a") else { return }
            let viewController = SFSafariViewController(url: url)
            present(viewController, animated: true)
        default:
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "content") as? ContentViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the cell size based on the collection view's width
        let numberOfItemsPerRow: CGFloat = 2 // Number of items per row in the 2x2 grid
        let spacingBetweenItems: CGFloat = 25
        let totalSpacing = (numberOfItemsPerRow - 1) * spacingBetweenItems
        let width = (contentCollectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        
        // You can adjust the height as needed or use an aspect ratio based on the width
        let height = width // Square cells in this example
        
        return CGSize(width: width, height: height)
    }
}

