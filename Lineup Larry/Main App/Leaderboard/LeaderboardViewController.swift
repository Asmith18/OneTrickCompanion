//
//  LeaderboardViewController.swift
//  Lineup Larry
//
//  Created by Adam Smith on 1/11/24.
//

import UIKit
import IQKeyboardManagerSwift

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var viewModel: LeaderboardViewModel!
    var filteredPlayers: [Player] = []
    var isSearchBarVisible = false
    
    @IBOutlet weak var LeaderboardTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel = LeaderboardViewModel(delegate: self)
        searchBar.delegate = self
        setupSearchBar()
        IQKeyboardManager.shared.enable = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0)
        LeaderboardTableView.separatorColor = .white
    }
    
    private func setupTableView() {
        self.LeaderboardTableView.delegate = self
        self.LeaderboardTableView.dataSource = self
    }
    
    func setupSearchBar() {
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            let attributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: UIColor.white]
            textField.attributedPlaceholder = NSAttributedString(string: "Search Player...", attributes: attributes)
            
            textField.textColor = UIColor.white
            
            textField.tintColor = UIColor.white
            
            if let leftView = textField.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.white
            }
            
            if let clearButton = textField.value(forKey: "clearButton") as? UIButton {
                clearButton.setImage(clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
                clearButton.tintColor = UIColor.white
            }
        }
    }
    
    @IBAction func searchButtontapped(_ sender: Any) {
        isSearchBarVisible.toggle()
        searchBar.isHidden = !isSearchBarVisible
        
        if isSearchBarVisible {
            searchBar.becomeFirstResponder()
        } else {
            searchBar.resignFirstResponder()
            searchBar.text = ""
            searchBar(searchBar, textDidChange: "")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredPlayers = searchText.isEmpty ? viewModel.players : viewModel.players.filter({ player in
            player.gameName?.range(of: searchText, options: .caseInsensitive) != nil
        })
        LeaderboardTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPlayers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Leaderboard", for: indexPath) as? LeaderboardTableViewCell else { return UITableViewCell() }
        let fetchedPlayer = filteredPlayers[indexPath.row]
        cell.updateViews(for: fetchedPlayer)
        cell.selectionStyle = .none
        return cell
    }
}

extension LeaderboardViewController: LeaderboardViewModelDelegate {
    func leaderboardHasData() {
        self.filteredPlayers = self.viewModel.players
        DispatchQueue.main.async {
            self.LeaderboardTableView.reloadData()
        }
    }
    
    func encountered(_ error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            let alertController = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Close", style: .cancel))
            alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [weak self] _ in
                self?.viewModel.fetch()
            }))
            self.present(alertController, animated: true)
        }
    }
}
