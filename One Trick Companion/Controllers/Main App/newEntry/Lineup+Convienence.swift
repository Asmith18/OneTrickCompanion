//
//  Lineup+Convienence.swift
//  One Trick Companion
//
//  Created by adam smith on 3/27/22.
//

import Foundation
import CoreData
import UIKit

extension Lineup {
    
    convenience init(moc: NSManagedObjectContext = CoreDataStack.context, agentImage: Data = Data(), mapName: String = "", instructions: String = "", title: String, overviewImages: NSOrderedSet = [], date: Date = Date()) {
        self.init(context: moc)
        self.agentImage = agentImage
        self.mapName = mapName
        self.instructions = instructions
        self.title = title
        self.overviewImages = overviewImages
        self.date = date
    }
}

