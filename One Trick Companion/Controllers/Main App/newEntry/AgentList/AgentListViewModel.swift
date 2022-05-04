//
//  NoteViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation

protocol AgentListViewModelDelegate: AnyObject {
    func agentListHasData()
    func encountered(_ error: Error)
}

class AgentListViewModel {
    
    var agentData: [AgentData] = []
    var dataProvider = AgentDataProvider()
    weak var delegate: AgentListViewModelDelegate?
    
    init(delegate: AgentListViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .agent) { result in
            switch result {
            case .success(let agent):
                self.agentData = agent.data
                self.delegate?.agentListHasData()
            case .failure(let error):
                print(error)
                self.delegate?.encountered(error)
            }
        }
    }
}
