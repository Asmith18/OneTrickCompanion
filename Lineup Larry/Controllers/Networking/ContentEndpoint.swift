//
//  ContentEndpoint.swift
//  One Trick Companion
//
//  Created by adam smith on 3/16/22.
//

import Foundation

extension URL {
    static let mapsBaseURL = URL(string: "https://valorant-api.com/v1/maps")
    static let weaponBaseURL = URL(string: "https://valorant-api.com/v1/weapons")
    static let agentBaseURL = URL(string: "https://valorant-api.com/v1/agents?isPlayableCharacter=true")
    static let gameModeBaseURL = URL(string: "https://valorant-api.com/v1/gamemodes")
    static let rankBaseURL = URL(string: "https://valorant-api.com/v1/competitivetiers")
}

enum ContentEndpoint {
    case agent
    case map
    case weapon
    case gamemode
    case ranks
    
    var url: URL? {
        guard let mapsBaseUrl = URL.mapsBaseURL else { return nil }
        guard let weaponBaseUrl = URL.weaponBaseURL else { return nil }
        guard let agentBaseUrl = URL.agentBaseURL else { return nil }
        guard let gameModeBaseUrl = URL.gameModeBaseURL else { return nil }
        guard let rankBaseUrl = URL.rankBaseURL else { return nil }
        
        switch self {
        case .map:
            return mapsBaseUrl
        case .weapon:
            return weaponBaseUrl
        case .agent:
            return agentBaseUrl
        case .gamemode:
            return gameModeBaseUrl
        case .ranks:
            return rankBaseUrl
        }
    }
}
