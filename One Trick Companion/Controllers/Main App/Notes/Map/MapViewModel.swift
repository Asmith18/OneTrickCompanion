//
//  MapViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation

protocol MapViewModelDelegate: AnyObject {
    func mapListHasData()
    func encountered(_ error: Error)
}

class MapViewModel {
    
    var map: Map?
    var mapData: [MapData] = []
    var dataProvider = MapDataProvider()
    weak var delegate: MapViewModelDelegate?
    
    init(delegate: MapViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .map) { result in
                switch result {
                case .success(let mapList):
                    self.mapData = mapList.data
                    self.delegate?.mapListHasData()
                case .failure(let error):
                    print(error)
                    self.delegate?.encountered(error)
            }
        }
    }
}
