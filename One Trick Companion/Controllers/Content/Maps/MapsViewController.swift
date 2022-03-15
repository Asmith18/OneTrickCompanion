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
    var mapData: [MapData] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapsTableView.dataSource = self
        self.mapsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mapData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mapsCell", for: indexPath) as? MapsTableViewCell else { return UITableViewCell() }
        let result = mapData[indexPath.row]
        cell.updateViews(maps: result)
        
        return cell
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
