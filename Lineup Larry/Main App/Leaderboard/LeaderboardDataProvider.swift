//
//  LeaderboardDataProvider.swift
//  Lineup Larry
//
//  Created by Adam Smith on 1/11/24.
//

import Foundation

protocol LeaderboardDataProvidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<[Player], NetworkError>) -> Void)
}
    
class LeaderboardDataProvider: APIDataProvidable, LeaderboardDataProvidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<[Player], NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        perform(URLRequest(url: url)) { result in
            switch result{
            case .success(let player):
                let decoder = JSONDecoder()
                do {
                    let player = try decoder.decode([Player?].self, from: player)
                    let validPlayers = player.compactMap({ $0 })
                    completion(.success(validPlayers))
                } catch {
                    completion(.failure(.couldNotUnwrap))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
