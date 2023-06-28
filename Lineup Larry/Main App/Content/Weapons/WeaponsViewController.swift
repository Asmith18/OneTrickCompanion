//
//  WeaponsViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class WeaponsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var weaponTableView: UITableView!
    
    var viewModel: WeaponsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weaponTableView.dataSource = self
        self.weaponTableView.delegate = self
        viewModel = WeaponsViewModel(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.weaponData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weaponCell", for: indexPath) as? WeaponsTableViewCell else { return UITableViewCell() }
        let result = viewModel.weaponData[indexPath.row]
        cell.updateViews(weapon: result)
        cell.selectionStyle = .none
        cell.setNeedsUpdateConstraints() 
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension WeaponsViewController: WeaponsViewModelDelegate {
    
    func weaponListHasData() {
        self.weaponTableView.reloadData()
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
