//
//  Maps.swift
//  One Trick Companion
//
//  Created by adam smith on 3/12/22.
//

import Foundation

//MARK: - RIOT GAMES API
class Map: Decodable {
    let data: [MapData]
    
    init(data: [MapData]) {
        self.data = data
    }
}

class MapData: Decodable {
    let displayName: String?
    let uuid: String?
    let listViewIcon: String?
    let splash: String?
    let coordinates: String?
    
    enum CodingKeys: CodingKey {
        case displayName
        case uuid
        case listViewIcon
        case splash
        case coordinates
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        self.uuid = try container.decodeIfPresent(String.self, forKey: .uuid)
        self.listViewIcon = try container.decodeIfPresent(String.self, forKey: .listViewIcon)
        self.splash = try container.decodeIfPresent(String.self, forKey: .splash)
        self.coordinates = try container.decodeIfPresent(String.self, forKey: .coordinates)
    }
}
