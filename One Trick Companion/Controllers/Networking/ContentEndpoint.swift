//
//  ContentEndpoint.swift
//  One Trick Companion
//
//  Created by adam smith on 3/16/22.
//

import Foundation
import SwiftUI

extension URL {
    static let leaderboardBaseURL = URL(string: "https://na.api.riotgames.com/val/ranked/v1/leaderboards/by-act/52e9749a-429b-7060-99fe-4595426a0cf7?size=200&startIndex=0&api_key=RGAPI-aac06334-4b05-40c0-999a-55b27af72e43")
    
}

enum ContentEndpoint {
//    case agent
//    case map
//    case skins
//    case weapon
//    case gamemode
//    case ranks
    case leaderboard
    
    var url: URL? {
        guard let baseUrl = URL.leaderboardBaseURL else { return nil }
        
        switch self {
        case .leaderboard:
            return baseUrl
        }
    }
}
