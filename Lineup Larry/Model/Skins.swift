//
//  Skins.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

struct Skins: Decodable {
    let data: [SkinsData]
}

struct SkinsData: Decodable {
    let displayIcon: String?
    let displayName: String
    let chromas: [Chromas]
}

struct Chromas: Decodable {
    let displayIcon: String?
    let swatch: String
}
