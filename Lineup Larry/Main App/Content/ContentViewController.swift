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
    
    let spacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contents"
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "content", for: indexPath) as? ContentCollectionViewCell else { return  UICollectionViewCell() }
        
        switch indexPath.item {
        case 0:
            cell.cellLabel.text = "Agents"
            cell.cellView.layer.cornerRadius = 25
        case 1:
            cell.cellLabel.text = "Maps"
            cell.cellView.layer.cornerRadius = 25
        case 2:
            cell.cellLabel.text = "Weapons"
            cell.cellView.layer.cornerRadius = 25
        case 3:
            cell.cellLabel.text = "TOS"
            cell.cellView.layer.cornerRadius = 25
        default:
            cell.cellLabel.text = nil
            cell.cellView.layer.cornerRadius = 25
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let storyboard = UIStoryboard(name: "AgentContent", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "AgentContent") as? AgentsViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: false)
        case 1:
            let storyboard = UIStoryboard(name: "MapContent", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "MapContent") as? MapsViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: false)
        case 2:
            let storyboard = UIStoryboard(name: "WeaponContent", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "WeaponContent") as? WeaponsViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: false)
        case 3:
            guard let url = URL(string: "https://www.termsfeed.com/live/8f3ca374-a82c-4d9e-a487-c5c35fd6e49a") else { return }
            let viewController = SFSafariViewController(url: url)
            present(viewController, animated: true)
        default:
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "content") as? ContentViewController else { return }
            self.navigationController?.pushViewController(viewController, animated: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the cell size with 2 cells per row and equal spacing between cells and edges
        let spacing: CGFloat = 10 // You can adjust the spacing here as needed
        let width = (collectionView.frame.width - 3 * spacing) / 2
        let height = width // 1:1 aspect ratio
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}

