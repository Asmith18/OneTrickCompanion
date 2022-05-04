//
//  AboutViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 4/28/22.
//

import UIKit
import SafariServices

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @IBAction func visitStatefulbuttonPressed(_ sender: Any) {
        visitStateful()
    }
    
    func visitStateful() {
        guard let url = URL(string: "https://statefulacademy.com/") else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}
