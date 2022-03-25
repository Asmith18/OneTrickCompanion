//
//  ContentEndpoint.swift
//  One Trick Companion
//
//  Created by adam smith on 3/16/22.
//

import Foundation
import SwiftUI

extension URL {
    static let leaderboardBaseURL = URL(string: "https://na.api.riotgames.com/val/ranked/v1/leaderboards/by-act/52e9749a-429b-7060-99fe-4595426a0cf7?size=200&startIndex=0&api_key=RGAPI-bf471841-d37d-423b-b0fd-baf13a470ffd")
    static let mapsBaseURL = URL(string: "https://valorant-api.com/v1/maps")
    static let weaponBaseURL = URL(string: "https://valorant-api.com/v1/weapons")
    static let agentBaseURL = URL(string: "https://valorant-api.com/v1/agents")
    static let gameModeBaseURL = URL(string: "https://valorant-api.com/v1/gamemodes")
    static let rankBaseURL = URL(string: "https://valorant-api.com/v1/competitivetiers")
}

enum ContentEndpoint {
    case agent
    case map
//    case skins
    case weapon
    case gamemode
    case ranks
    case leaderboard
    
    var url: URL? {
        guard let leaderboardbaseUrl = URL.leaderboardBaseURL else { return nil }
        guard let mapsBaseUrl = URL.mapsBaseURL else { return nil }
        guard let weaponBaseUrl = URL.weaponBaseURL else { return nil }
        guard let agentBaseUrl = URL.agentBaseURL else { return nil }
        guard let gameModeBaseUrl = URL.gameModeBaseURL else { return nil }
        guard let rankBaseUrl = URL.rankBaseURL else { return nil }
        
        switch self {
        case .leaderboard:
            return leaderboardbaseUrl
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
