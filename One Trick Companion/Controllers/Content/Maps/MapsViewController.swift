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
        self.mapsTableView.dataSource = self
        self.mapsTableView.delegate = self
        viewModel = MapsViewModel(delegate: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mapData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mapsCell", for: indexPath) as? MapsTableViewCell else { return UITableViewCell() }
        let result = viewModel.mapData[indexPath.row]
        cell.updateViews(maps: result)
        
        
        return cell
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}

extension MapsViewController: MapsViewModelDelegate {
    
    func mapListHasData() {
        DispatchQueue.main.async {
            self.mapsTableView.reloadData()
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
