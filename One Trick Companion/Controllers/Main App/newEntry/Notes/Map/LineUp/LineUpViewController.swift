//
//  LineUpViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import UIKit

class LineUpViewController: UIViewController {
    
    //MARK: - Outputs
    @IBOutlet weak var selectedAgentImageView: UIImageView!
    @IBOutlet weak var selectedMapImageView: UIImageView!
    @IBOutlet weak var instructionTextView: UITextView!
    
    var mapData: MapData?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
}
