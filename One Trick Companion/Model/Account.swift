//
//  Account.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - RIOT API

struct account: Decodable {
    let puuid: String
    let gameName: String
    let tagLine: String
}
