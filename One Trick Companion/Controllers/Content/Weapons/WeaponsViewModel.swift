//
//  WeaponsViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/17/22.
//

import Foundation

protocol WeaponsViewModelDelegate: AnyObject {
    func weaponListHasData()
    func encountered(_ error: Error)
}

class WeaponsViewModel {
    
    var weapon: Weapons?
    var weaponData: [WeaponsData] = []
    var dataProvider = WeaponDataProvider()
    weak var delegate: WeaponsViewModelDelegate?
    
    init(delegate: WeaponsViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .weapon) { result in
            switch result {
            case .success(let weaponList):
                self.weaponData = weaponList.data
                self.delegate?.weaponListHasData()
            case .failure(let error):
                print(error)
                self.delegate?.encountered(error)
            }
        }
    }
}
