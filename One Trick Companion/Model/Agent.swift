//
//  Agent.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - VALORANT-API.com
struct Agent: Decodable {
    let data: [AgentData]
}

struct AgentData: Decodable {
    let displayName: String
    let displayIcon: String?
    let role: AgentRole
    let abilities: [AgentAbilities]
    let description: String
    let fullPortrait: String
    let background: String
}

struct AgentRole: Decodable {
    let displayName: String
    let displayIcon: String?
    let description: String
}

struct AgentAbilities: Decodable {
    let slot: String
    let displayName: String
    let description: String
    let displayIcon: String?
}
