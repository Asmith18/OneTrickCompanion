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
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
//MARK: - Actions

    
    @IBAction func termsAndConditionsButtonPressed(_ sender: Any) {
        guard let url = URL(string: "https://app.websitepolicies.com/policies/view/93tkg5qe") else { return }
                let viewController = SFSafariViewController(url: url)
        present(viewController, animated: true)
    }
}

