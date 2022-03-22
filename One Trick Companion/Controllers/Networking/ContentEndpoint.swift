//
//  ContentEndpoint.swift
//  One Trick Companion
//
//  Created by adam smith on 3/16/22.
//

import Foundation
import SwiftUI

extension URL {
    static let leaderboardBaseURL = URL(string: "https://na.api.riotgames.com/val/ranked/v1/leaderboards/by-act/52e9749a-429b-7060-99fe-4595426a0cf7?size=200&startIndex=0&api_key=RGAPI-8f7cd289-790f-4da5-abfd-a860cc62cfe5")
    static let mapsBaseURL = URL(string: "https://valorant-api.com/v1/maps")
    
}

enum ContentEndpoint {
//    case agent
    case map
//    case skins
//    case weapon
//    case gamemode
//    case ranks
    case leaderboard
    
    var url: URL? {
        guard let leaderboardbaseUrl = URL.leaderboardBaseURL else { return nil }
        guard let mapsBaseUrl = URL.mapsBaseURL else { return nil }
        
        switch self {
        case .leaderboard:
            return leaderboardbaseUrl
        case .map:
            return mapsBaseUrl
        }
    }
}
