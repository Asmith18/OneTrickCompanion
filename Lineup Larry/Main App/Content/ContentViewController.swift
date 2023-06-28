//
//  ContentViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit
import SafariServices

class ContentViewController: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var mapsbuttom: UIButton!
    @IBOutlet weak var weaponsButton: UIButton!
    @IBOutlet weak var agentsButton: UIButton!
    @IBOutlet weak var gamemodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0)
    }
//MARK: - Actions

    
    @IBAction func termsAndConditionsButtonPressed(_ sender: Any) {
        guard let url = URL(string: "https://www.termsfeed.com/live/8f3ca374-a82c-4d9e-a487-c5c35fd6e49a") else { return }
                let viewController = SFSafariViewController(url: url)
        present(viewController, animated: true)
    }
}

