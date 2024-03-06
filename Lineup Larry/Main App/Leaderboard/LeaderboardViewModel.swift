//
//  LeaderboardViewModel.swift
//  Lineup Larry
//
//  Created by Adam Smith on 1/11/24.
//

import Foundation

protocol LeaderboardViewModelDelegate: AnyObject {
    func leaderboardHasData()
    func encountered(_ error: Error)
}

class LeaderboardViewModel {
    
    var player: [Player] = []
    var dataProvider = LeaderboardDataProvider()
    weak var delegate: LeaderboardViewModelDelegate?
    
    init(delegate: LeaderboardViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .leaderboard) { [weak self] result in
            switch result {
            case .success(let fetchedPlayers):
                self?.player = fetchedPlayers.players
                self?.delegate?.leaderboardHasData()
            case .failure(let error):
                print(error)
                self?.delegate?.encountered(error)
            }
        }
    }
}
