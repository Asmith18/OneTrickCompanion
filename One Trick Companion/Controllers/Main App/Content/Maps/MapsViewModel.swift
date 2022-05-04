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
    
    var map: Map?
    var mapData: [MapData] = []
    var dataProvider = MapsDataProvider()
    weak var delegate: MapsViewModelDelegate?
    
    init(delegate: MapsViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .map) { result in
            DispatchQueue.main.async {
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
    
}
