//
//  LeaderboardTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/14/22.
//

import UIKit

class LeaderboardTableViewController: UITableViewController {
    
//MARK: - Outlets
    @IBOutlet weak var leaderboardRankTextLabel: UILabel!
    @IBOutlet weak var playerNameTextlabel: UILabel!
    @IBOutlet weak var rankedRationTextLabel: UILabel!
    @IBOutlet weak var rankTextLabel: UILabel!
    
//MARK: - Properties
    var leaderboard: Leaderboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return leaderboard.players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardCell", for: indexPath)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

