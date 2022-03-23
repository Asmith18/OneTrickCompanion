//
//  RankDataProvider.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation

protocol RankDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Ranks, NetworkError>) -> Void)
}

struct RankDataProvider: APIDataProvidable, RankDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Ranks, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        perform(URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let rank = try decoder.decode(Ranks.self, from: data)
                    completion(.success(rank))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
