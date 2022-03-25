//
//  RankViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class RankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - Outputs
    @IBOutlet weak var rankTableView: UITableView!
    
    var viewModel: RankViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rankTableView.dataSource = self
        self.rankTableView.delegate = self
        viewModel = RankViewModel(delegate: self)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rankData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "rankCell", for: indexPath) as? RankTableViewCell else { return UITableViewCell() }
        let result = viewModel.rankData[indexPath.row]
        cell.updateViews(rank: result)
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension RankViewController: RankViewModelDelegate {
    
    func rankListHasData() {
        rankTableView.reloadData()
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
