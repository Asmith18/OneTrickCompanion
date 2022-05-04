//
//  Agent.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - VALORANT-API.com
class Agent: Decodable {
    
    init(data: [AgentData]) {
        self.data = data
    }
    
    let data: [AgentData]
}

class AgentData: Decodable {
    
    init(displayName: String?, displayIcon: String?, displayIconSmall: String, role: AgentRole?, abilities: [AgentAbilities], description: String?, fullPortrait: String?, background: String?) {
        self.displayName = displayName
        self.displayIcon = displayIcon
        self.displayIconSmall = displayIconSmall
        self.role = role
        self.abilities = abilities
        self.description = description
        self.fullPortrait = fullPortrait
        self.background = background
    }
    
    let displayName: String?
    let displayIcon: String?
    let displayIconSmall: String
    let role: AgentRole?
    let abilities: [AgentAbilities]
    let description: String?
    let fullPortrait: String?
    let background: String?
}

class AgentRole: Decodable {
    
    init(displayName: String, displayIcon: String, description: String?) {
        self.displayName = displayName
        self.displayIcon = displayIcon
        self.description = description
    }
    
    let displayName: String
    let displayIcon: String
    let description: String?
}

class AgentAbilities: Decodable {
    
    init(slot: String?, displayName: String?, description: String?, displayIcon: String?) {
        self.slot = slot
        self.displayName = displayName
        self.description = description
        self.displayIcon = displayIcon
    }
    
    let slot: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
}
