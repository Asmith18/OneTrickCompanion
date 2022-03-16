//
//  MapsViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/16/22.
//

import Foundation

protocol MapsViewModelDelegate: AnyObject {
    func mapListHasData()
    func encountered(_ error: Error)
}

class MapsViewModel {
    
    var mapData: [MapData] = []
    weak var delegate: MapsViewModelDelegate?
    
    init(delegate: MapsViewModelDelegate) {
        self.delegate = delegate
    }
    
}
