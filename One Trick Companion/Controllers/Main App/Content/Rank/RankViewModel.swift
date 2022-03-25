//
//  RankViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation

protocol RankViewModelDelegate: AnyObject {
    func rankListHasData()
    func encountered(_ error: Error)
}

class RankViewModel {
    
    var rank: Ranks?
    var rankData: [RanksData] = []
    var dataProvider = RankDataProvider()
    weak var delegate: RankViewModelDelegate?
    
    init(delegate: RankViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .ranks) { result in
            switch result {
            case.success(let rankList):
                self.rankData = rankList.data
                self.delegate?.rankListHasData()
            case .failure(let error):
                print(error)
                self.delegate?.encountered(error)
            }
        }
    }
}
