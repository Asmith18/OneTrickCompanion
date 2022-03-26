//
//  GameModeViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation

protocol GameModeViewModelDelegate: AnyObject {
    func gameModeListHasData()
    func encountered(_ error: Error)
}

class GameModeViewModel {
    
    var gameModeData: [GameModeData] = []
    var dataProvider = GameModeDataProvider()
    weak var delegate: GameModeViewModelDelegate?
    
    init(delegate: GameModeViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .gamemode) { result in
            switch result {
            case .success(let gameModeList):
                self.gameModeData = gameModeList.data
                self.delegate?.gameModeListHasData()
            case .failure(let error):
                print(error)
                self.delegate?.encountered(error)
            }
        }
    }
}
