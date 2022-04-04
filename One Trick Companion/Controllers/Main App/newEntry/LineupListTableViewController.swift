//
//  NewEntryTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/25/22.
//

import UIKit
import CoreData
import SwiftUI

class LineupListTableViewController: UITableViewController {

    var viewModel: LineupListViewMdoel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Line Up Larry"
        tableView.frame = view.bounds
        viewModel = LineupListViewMdoel()
        viewModel.fetchedResultsController.delegate = self
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fetchedResultsController.sections?[0].numberOfObjects ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lineupCell", for: indexPath) as? LineupListTableViewCell else { return UITableViewCell()}
        let lineup = viewModel.fetchedResultsController.object(at: indexPath)
        cell.updateViews(lineup: lineup)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = viewModel.fetchedResultsController.object(at: indexPath)
            viewModel?.deleteLineup(lineup: entryToDelete)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toeditSegue" {
            guard let destination = segue.destination as? LineUpViewController,
                  let indexPath = tableView.indexPathForSelectedRow else { return }
            let lineup = viewModel.fetchedResultsController.object(at: indexPath)
            let viewModel = LineUpViewModel(map: nil, agent: nil, lineup: lineup)
            destination.viewModel = viewModel
        }
    }
}

extension LineupListTableViewController: LineupListViewModelDelegate {
    
    func LineupsHasData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func encounteredError(_ error: Error) {
    }
}

extension LineupListTableViewController: NSFetchedResultsControllerDelegate {
    // Conform to the NSFetchedResultsControllerDelegate
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    //sets behavior for cells
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

        switch type{
            case .delete:
                guard let indexPath = indexPath else { break }
                tableView.deleteRows(at: [indexPath], with: .fade)
            case .insert:
                guard let newIndexPath = newIndexPath else { break }
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            case .move:
                guard let indexPath = indexPath, let newIndexPath = newIndexPath else { break }
                tableView.moveRow(at: indexPath, to: newIndexPath)
            case .update:
                guard let indexPath = indexPath else { break }
                tableView.reloadRows(at: [indexPath], with: .automatic)

            @unknown default:
                fatalError()
        }
    }

    //additional behavior for cells
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {

        switch type {
            case .insert:
                tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
            case .delete:
                tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
            case .move:
                break
            case .update:
                break
            @unknown default:
                fatalError()
        }
    }
}

