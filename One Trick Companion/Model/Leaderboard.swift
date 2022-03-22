//
//  Leaderboard.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - RIOT API

struct leaderboard: Decodable {
    let player: [LeaderboardData]
    let actId: String
}

struct LeaderboardData: Decodable {
    let puuid: String
    let gameName: String
    let tagLine: String
    let leaderboardRank: Int
    let rankedRating: Int
}
