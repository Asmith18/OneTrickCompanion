//
//  NewEntryTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/25/22.
//

import UIKit
import CoreData

class LineupListTableViewController: UITableViewController {
    

    var viewModel: LineupListViewMdoel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Line Ups"
        tableView.frame = view.bounds
        viewModel = LineupListViewMdoel(delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchLineup()
        tableView.reloadData()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lineupCell", for: indexPath) as? LineupListTableViewCell else { return UITableViewCell()}
        cell.updateViews(lineup: lineup)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        if segue.identifier == "toagentSegue" {
           guard let destination = segue.destination as? AgentListViewController,
            let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            let lineup = viewModel.lineups[selectedRow]
        } else if segue.identifier == "toeditSegue" {
            guard let destination = segue.destination as? LineUpViewController,
                  let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            let lineup = viewModel.lineups[selectedRow]
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
