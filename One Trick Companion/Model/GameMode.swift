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

struct GameModeData: Decodable {
    let displayName: String
    let displayIcon: String?
    let duration: String?
    
}
