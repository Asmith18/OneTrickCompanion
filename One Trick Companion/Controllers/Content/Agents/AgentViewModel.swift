//
//  AgentViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/21/22.
//

import Foundation

protocol AgentViewModelDelegate: AnyObject {
    func agentListHasData()
    func encountered(_ error: Error)
}

class AgentViewModel {
    
    var agent: Agent?
    var agentData: [AgentData] = []
    var dataProvider = AgentDataProvider()
    weak var delegate: AgentViewModelDelegate?
    
    init(delegate: AgentViewModelDelegate) {
        self.delegate = delegate
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .agent) { result in
            switch result {
            case .success(let agentList):
                self.agentData = agentList.data
                self.delegate?.agentListHasData()
            case .failure(let error):
                print(error)
                self.delegate?.encountered(error)
            }
        }
    }
}
