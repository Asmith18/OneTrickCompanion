//
//  Weapons.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

struct Weapons: Decodable {
    let data: [WeaponsData]
}

struct WeaponsData: Decodable {
    let displayName: String
    let displayIcon: String?
    let weaponStats: [WeaponStats]
}

struct WeaponStats: Decodable {
    let fireRate: Int
    let magazineSize: Int
    let firstBulletAccuracy: Double
}
