//
//  MapTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class MapTableViewController: UITableViewController {
    
    var viewModel: MapViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Map"
        buildTableView()
    }
    
    private func buildTableView() {
        tableView.register(MapTableViewCell.nib(), forCellReuseIdentifier: MapTableViewCell.reuseId)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mapData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.reuseId, for: indexPath) as? MapTableViewCell else { return UITableViewCell() }
        let result = viewModel.mapData[indexPath.row]
        cell.updateView(result)
        
        cell.needsUpdateConstraints()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width / 4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailSegue", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toDetailSegue",
              let destination = segue.destination as? LineUpViewController,
              let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
        let map = viewModel.mapData[selectedRow]
        let lineupViewModel = LineUpViewModel(map: map, agent: viewModel.agentData, lineup: nil)
        destination.viewModel = lineupViewModel
    }
}

extension MapTableViewController: MapViewModelDelegate {
    
    func mapListHasData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func encountered(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Close", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [weak self] _ in
            self?.viewModel.fetch()
        }))
        present(alertController, animated: true)
    }
}
