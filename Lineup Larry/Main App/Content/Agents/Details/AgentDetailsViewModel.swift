//
//  AgentDetailsViewModel.swift
//  Lineup Larry
//
//  Created by Adam Smith on 7/5/23.
//

import Foundation
protocol AgentDetailsViewModelDelegate: AnyObject {
    func abilitiesHasData()
    func encountered(_ error: Error)
}

class AgentDetailsViewModel {
    
    var agent: AgentData?
    var agentData: [AgentData] = []
    var ability: AgentAbilities?
    var abilities: [AgentAbilities] = []
    var dataProvider = AgentListDataProvider()
    weak var delegate: AgentDetailsViewModelDelegate?
    
    init(delegate: AgentDetailsViewModelDelegate, agent: AgentData?) {
        self.delegate = delegate
        self.agent = agent
        fetch()
    }
    
    func fetch() {
        dataProvider.fetch(from: .agent) { result in
            switch result {
            case .success(let agent):
                self.agentData = agent.data
                self.delegate?.abilitiesHasData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
