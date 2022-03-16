//
//  LeaderboardViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/16/22.
//

import Foundation
protocol LeaderboardViewModelDelegate: AnyObject {
    func leaderboardListHasData()
    func encountered(_ error: Error)
}

class LeaderboardViewModel {
    
    var leaderboardResults: Leaderboard?
    var players: [LeaderboardData] = []
    var dataProvider = LeaderboardDataProvider()
    weak var delegate: LeaderboardViewModelDelegate?
    
    init(delegate: LeaderboardViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .leaderboard) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let leaderboardList):
                    self.players = leaderboardList.players
                    self.delegate?.leaderboardListHasData()
                case .failure(let error):
                    print(error)
                    self.delegate?.encountered(error)
                }
            }
        }
    }
}
