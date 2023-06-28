//
//  MapsViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class MapsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var mapsTableView: UITableView!
    
    //MARK: - Properties
    var viewModel: MapsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MapsViewModel(delegate: self)
        buildTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    private func buildTableView() {
        self.mapsTableView.dataSource = self
        self.mapsTableView.delegate = self
        mapsTableView.register(MapTableViewCell.nib(), forCellReuseIdentifier: MapTableViewCell.reuseId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mapData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.reuseId, for: indexPath) as? MapTableViewCell else { return UITableViewCell() }
        let result = viewModel.mapData[indexPath.row]
        cell.updateView(result)
        cell.selectionStyle = .none
        cell.setNeedsUpdateConstraints() 
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width / 4
    }
}

extension MapsViewController: MapsViewModelDelegate {
    
    func mapListHasData() {
            self.mapsTableView.reloadData()
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
