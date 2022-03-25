//
//  MapTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class MapTableViewController: UITableViewController {
    
    var viewModel: MapViewModel!
    var agentData: AgentData?

    override func viewDidLoad() {
        super.viewDidLoad()
        buildTableView()
        viewModel = MapViewModel(delegate: self)
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

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
