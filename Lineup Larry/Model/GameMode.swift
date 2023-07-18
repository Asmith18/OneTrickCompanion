//
//  GameMode.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

struct GameMode: Decodable {
    let data: [GameModeData]
}

struct GameModeData: Decodable, Hashable {
    let displayName: String?
    let displayIcon: String?
    let duration: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(displayName)
    }
    
    static func == (lhs: GameModeData, rhs: GameModeData) -> Bool {
        return lhs.displayName == rhs.displayName
    }
}
