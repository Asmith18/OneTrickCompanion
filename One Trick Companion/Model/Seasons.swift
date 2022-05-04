//
//  Seasons.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - RIOT API
struct Season: Decodable {
    let acts: [SeasonData]
}

struct SeasonData: Decodable {
    let id: String
    let type: String
    let name: String
    let isActive: Bool
}
