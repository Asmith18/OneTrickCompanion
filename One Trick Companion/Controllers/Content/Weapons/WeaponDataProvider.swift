//
//  WeaponDataProvider.swift
//  One Trick Companion
//
//  Created by adam smith on 3/17/22.
//

import Foundation

protocol WeaponsDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Weapons, NetworkError>) -> Void)
}

struct WeaponDataProvider: APIDataProvidable, WeaponsDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Weapons, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        perform(URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let leaderboard = try decoder.decode(Weapons.self, from: data)
                    completion(.success(leaderboard))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
