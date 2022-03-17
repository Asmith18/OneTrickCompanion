//
//  WeaponsViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class WeaponsViewController: UIViewController {
    
    @IBOutlet weak var weaponTableView: UITableView!
    
    var viewModel: WeaponsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
