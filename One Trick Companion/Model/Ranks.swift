//
//  Ranks.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

struct Ranks: Decodable {
    let data: [RanksData]
}

struct RanksData: Decodable {
    let tier: Int
    let tierName: String?
    let divisionName: String?
    let smallIcon: String?
}
