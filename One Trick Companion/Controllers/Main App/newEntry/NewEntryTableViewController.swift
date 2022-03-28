//
//  NewEntryTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/25/22.
//

import UIKit
import CoreData

class NewEntryTableViewController: UITableViewController {
    

    var viewModel: NewEntryViewMdoel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Line Ups"
        tableView.frame = view.bounds
        viewModel = NewEntryViewMdoel(delegate: self)
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didTapEdit))
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Line Up", message: "Enter Line Up Name", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { _ in
            guard let field = alert.textFields?.first, let title = field.text, !title.isEmpty else {
                return
            }
            
            self.viewModel?.createLineup(title: title)

        }))
        present(alert, animated: true)
    }
    
    @objc func didTapEdit() {
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            
        }))
        present(sheet, animated: true)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lineups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let lineup = viewModel?.lineups[indexPath.row] else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lineupCell", for: indexPath) as? NewEntryTableViewCell else { return UITableViewCell()}
        cell.updateViews(lineup: lineup)
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = viewModel.lineups[indexPath.row] 
            viewModel?.deleteLineup(lineup: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

extension NewEntryTableViewController: NewEntryViewModelDelegate {
    
    func LineupsHasData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func encounteredError(_ error: Error) {
    }
}













//    //MARK: - Core Data
//
//    func getAllEntry() {
//        do {
////            models = try context.fetch(NewEntry.fetchRequest())
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        } catch {
//
//        }
//    }
//
//    func createEntry(name: String) {
////        let entry = NewEntry(context: context)
//        entry.name = name
//        entry.date = Date()
//
//        do {
//            try context.save()
//            getAllEntry()
//        } catch {
//
//        }
//    }
//
////    func deleteEntry(entry: NewEntry) {
//        context.delete(entry)
//
//        do {
//            try context.save()
//            getAllEntry()
//        } catch {
//
//        }
//    }
//
//    func updateEntry(name: String) {
////        let newEntry = NewEntry(context: context)
//        newEntry.name = name
//        do {
//            try context.save()
//            getAllEntry()
//        } catch {
//
//        }
//    }
