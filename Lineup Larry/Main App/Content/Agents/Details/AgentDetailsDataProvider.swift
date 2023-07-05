//
//  AgentDetailsDataProvider.swift
//  Lineup Larry
//
//  Created by Adam Smith on 7/5/23.
//

import Foundation

protocol AgentDetailsDataprovidable {
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<AgentData, NetworkError>) -> Void)
}

fileprivate var agentCache = NSCache<NSString, AgentData>()

class AgentDetailsDataProvider: APIDataProvidable, AgentDetailsDataprovidable {
    
    func fetch(from endpoint: ContentEndpoint, completion: @escaping (Result<AgentData, NetworkError>) -> Void) {
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
                    let abilities = try decoder.decode(AgentData.self, from: data)
                    agentCache.setObject(abilities, forKey: url.path as NSString)
                    completion(.success(abilities))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
