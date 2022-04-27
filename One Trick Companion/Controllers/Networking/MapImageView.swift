//
//  mapImageView.swift
//  One Trick Companion
//
//  Created by adam smith on 3/17/22.
//

import Foundation
import UIKit


fileprivate var imageCache = NSCache<NSString, UIImage>()

class MapImageView: UIImageView, APIDataProvidable {
    
    func setImage(using url: String?) {
        guard let url = URL(string: url ?? "") else { return }
        if let cacheImage = imageCache.object(forKey: url.path as NSString) {
            self.image = cacheImage
            return
        }
        perform(URLRequest(url: url)) { [weak self] result in
            DispatchQueue.main.async {
                guard let data = try? result.get() else { return }
                self?.image = UIImage(data: data)
                imageCache.setObject(UIImage(data: data)!, forKey: url.path as NSString)
            }
        }
    }
}
