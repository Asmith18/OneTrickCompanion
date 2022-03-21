//
//  mapImageView.swift
//  One Trick Companion
//
//  Created by adam smith on 3/17/22.
//

import Foundation
import UIKit

class MapImageView: UIImageView, APIDataProvidable {
    func setImage(using url: URL) {
        perform(URLRequest(url: url)) { [weak self] result in
            DispatchQueue.main.async {
                guard let data = try? result.get() else { return }
                self?.image = UIImage(data: data)
            }
        }
    }
}
