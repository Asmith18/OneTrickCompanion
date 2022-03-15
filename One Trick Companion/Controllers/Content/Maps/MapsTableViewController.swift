//
//  MapsTableViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class MapsTableViewController: UITableViewController {
    
    var mapData: [MapData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mapData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "mapsCell", for: indexPath) as? MapsTableViewCell else { return UITableViewCell() }

        let data = mapData[indexPath.row]
        cell.updateViews(maps: data)
        return cell
    }
}
