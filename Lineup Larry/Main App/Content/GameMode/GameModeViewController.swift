//
//  GameModeViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class GameModeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - outlets
    @IBOutlet weak var gameModeTableView: UITableView!
    
    var viewModel: GameModeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameModeTableView.dataSource = self
        self.gameModeTableView.delegate = self
        viewModel = GameModeViewModel(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.gameModeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gamemodeCell", for: indexPath) as? GameModeTableViewCell else { return UITableViewCell() }
        let result = viewModel.gameModeData[indexPath.row]
        cell.updateViews(mode: result)
        cell.selectionStyle = .none
        cell.setNeedsUpdateConstraints() 
        return cell
    }
}

extension GameModeViewController: GameModeViewModelDelegate {
    
    func gameModeListHasData() {
        DispatchQueue.main.async {
            self.gameModeTableView.reloadData()
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
