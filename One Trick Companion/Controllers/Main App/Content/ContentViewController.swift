//
//  ContentViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/15/22.
//

import UIKit

class ContentViewController: UIViewController {

    //MARK: - outlets
    @IBOutlet weak var mapsbuttom: UIButton!
    @IBOutlet weak var weaponsButton: UIButton!
    @IBOutlet weak var agentsButton: UIButton!
    @IBOutlet weak var gamemodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
//MARK: - Actions
    @IBAction func mapsbuttonTapped(_ sender: Any) {
    }
    
    @IBAction func weaponsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func agentsButtonTapped(_ sender: Any) {
    }
    
    @IBAction func gameModesButtonTapped(_ sender: Any) {
    }
    
    @IBAction func termsAndConditionsButtonPressed(_ sender: Any) {
    }
    
}
