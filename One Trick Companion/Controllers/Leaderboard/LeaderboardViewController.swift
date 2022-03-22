//
//  LeaderboardViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var leaderboardTableView: UITableView!
    
    var viewModel: LeaderboardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardTableView.dataSource = self
        leaderboardTableView.delegate = self
        viewModel = LeaderboardViewModel(delegate: self)
    }
}

extension LeaderboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardCell", for: indexPath) as? LeaderboardTableViewCell else { return UITableViewCell() }
        let result = viewModel.players[indexPath.row]
        cell.updateViews(leaderboard: result)
        
        
        
        return cell
    }
}

extension LeaderboardViewController: LeaderboardViewModelDelegate {
    
    func leaderboardListHasData() {
        leaderboardTableView.reloadData()
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
