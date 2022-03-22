//
//  Maps.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - RIOT GAMES API
struct Map: Decodable {
    let data: [MapData]
}

struct MapData: Decodable {
    let displayName: String
    let uuid: String
    let listViewIcon: String
    let splash: String
    let coordinates: String
}
