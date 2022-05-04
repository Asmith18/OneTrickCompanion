//
//  Leaderboard.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - RIOT API

struct Leaderboard: Decodable {
    let players: [LeaderboardData]
    let actId: String
}

struct LeaderboardData: Decodable {
//    let puuid: String
    let gameName: String?
    let tagLine: String?
    let leaderboardRank: Int?
    let rankedRating: Int?
    let numberOfWins: Int?
}
