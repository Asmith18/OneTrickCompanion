//
//  AcknowledgmentsViewController.swift
//  One Trick Companion
//
//  Created by adam smith on 4/28/22.
//

import UIKit

class AcknowledgmentsViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setNeedsLayout()
        view.layoutSubviews()
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
