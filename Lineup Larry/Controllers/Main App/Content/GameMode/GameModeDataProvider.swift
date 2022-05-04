//
//  GameModeDataProvider.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation

protocol GameModeDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<GameMode, NetworkError>) -> Void)
}

struct GameModeDataProvider: APIDataProvidable, GameModeDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<GameMode, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        perform(URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let gameMode = try decoder.decode(GameMode.self, from: data)
                    completion(.success(gameMode))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
