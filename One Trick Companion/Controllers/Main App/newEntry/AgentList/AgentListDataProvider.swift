//
//  NoteDataProvider.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation

protocol AgentListDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Agent, NetworkError>) -> Void)
}

fileprivate var agentCache = NSCache<NSString, Agent>()

class AgentListDataProvider: APIDataProvidable, AgentListDataprovidable {
    
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<Agent, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        if let cacheAgent = agentCache.object(forKey: url.path as NSString) {
            completion(.success(cacheAgent))
        }
        perform(URLRequest(url: url)) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let agent = try decoder.decode(Agent.self, from: data)
                    agentCache.setObject(agent, forKey: url.path as NSString)
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
