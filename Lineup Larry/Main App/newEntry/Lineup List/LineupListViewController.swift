
//  LineupListViewController.swift
//  Lineup Larry
//
//  Created by Adam Smith on 7/7/23.


import UIKit
import CoreData

class LineupListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: LineupListViewMdoel!
    let spacing: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lineups"
        collectionView.frame = view.bounds
        viewModel = LineupListViewMdoel()
        viewModel.fetchedResultsController.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.fetchedResultsController.sections?[0].numberOfObjects ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lineupCell", for: indexPath) as? LineupListCollectionViewCell else { return UICollectionViewCell()}
        let lineup = viewModel.fetchedResultsController.object(at: indexPath)
        cell.updateViews(lineup: lineup)
        cell.layer.cornerRadius = 25
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let totalHorizontalSpacing = spacing * 3 // Two spacings between cells and one spacing on each side
        let cellWidth = (collectionViewWidth - totalHorizontalSpacing) / 2
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        self.performSegue(withIdentifier: "toeditSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toeditSegue" {
            guard let destination = segue.destination as? LineUpViewController,
                  let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let lineup = viewModel.fetchedResultsController.object(at: indexPath)
            let viewModel = LineUpViewModel(delegate: destination ,map: nil, agent: nil, lineup: lineup)
            destination.viewModel = viewModel
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView.reloadData()
    }
    
    //sets behavior for cells
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type{
        case .delete:
            guard let indexPath = indexPath else { break }
            collectionView.deleteItems(at: [indexPath])
        case .insert:
            guard let newIndexPath = newIndexPath else { break }
            collectionView.insertItems(at: [newIndexPath])
        case .move:
            guard let indexPath = indexPath, let newIndexPath = newIndexPath else { break }
            collectionView.moveItem(at: indexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else { break }
            collectionView.reloadItems(at: [indexPath])
            
        @unknown default:
            fatalError()
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        switch type {
        case .insert:
            collectionView.insertSections(IndexSet(integer: sectionIndex))
        case .delete:
            collectionView.deleteSections(IndexSet(integer: sectionIndex))
        case .move:
            break
        case .update:
            break
        @unknown default:
            fatalError()
        }
    }
}
extension LineupListViewController: LineupListViewModelDelegate {
    func LineupsHasData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
