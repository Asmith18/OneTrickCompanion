//
//  MapsTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class MapsTableViewController: UITableViewController {
    
    //MARK: - Outlets
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mapsCell", for: indexPath) 

        

        return cell
    }
}
