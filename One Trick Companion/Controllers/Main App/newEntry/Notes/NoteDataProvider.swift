//
//  NoteDataProvider.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation

protocol NoteDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Agent, NetworkError>) -> Void)
}

struct NoteDataProvider: APIDataProvidable, NoteDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Agent, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        perform(URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let agent = try decoder.decode(Agent.self, from: data)
                    completion(.success(agent))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
