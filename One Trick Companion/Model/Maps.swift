//
//  Maps.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - RIOT GAMES API
struct Map: Decodable {
    let maps: [MapData]
}

struct MapData: Decodable {
    let name: String
    let id: String
}
