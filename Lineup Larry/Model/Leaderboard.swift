//
//  Leaderboard.swift
//  Lineup Larry
//
//  Created by Adam Smith on 1/7/24.
//

import Foundation

struct Player: Decodable {
    let playerCardID: String?
    let titleID: String?
    let isBanned: Bool?
    let isAnonymized: Bool?
    let puuid: String?
    let gameName: String?
    let tagLine: String?
    let leaderboardRank: Int
    let rankedRating: Int
    let numberOfWins: Int
    let competitiveTier: Int
}
