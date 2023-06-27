//
//  AboutViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 4/28/22.
//

import UIKit
import SafariServices

class AboutViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setNeedsLayout()
        view.layoutSubviews()
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white]
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
