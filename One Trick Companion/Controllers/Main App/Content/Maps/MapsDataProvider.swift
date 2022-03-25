//
//  MapsDataProvider.swift
//  One Trick Companion
//
//  Created by adam smith on 3/17/22.
//

import Foundation

protocol MapsDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Map, NetworkError>) -> Void)
}

struct MapsDataProvider: APIDataProvidable, MapsDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Map, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        perform(URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let map = try decoder.decode(Map.self, from: data)
                    completion(.success(map))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
