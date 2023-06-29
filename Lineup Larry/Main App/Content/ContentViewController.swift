//
//  ContentViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit
import SafariServices

class ContentViewController: UIViewController {

    @IBOutlet weak var agentView: UIView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var weaponView: UIView!
    @IBOutlet weak var gameModeView: UIView!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var akView: UIView!
    @IBOutlet weak var tosView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        agentView.layer.cornerRadius = 12
        mapView.layer.cornerRadius = 12
        weaponView.layer.cornerRadius = 12
        gameModeView.layer.cornerRadius = 12
        aboutView.layer.cornerRadius = 12
        akView.layer.cornerRadius = 12
        tosView.layer.cornerRadius = 12
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

