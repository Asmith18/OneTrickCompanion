//
//  Newentry+CoreDataProperties.swift
//  One Trick Companion
//
//  Created by adam smith on 3/25/22.
//
//

import Foundation
import CoreData


extension NewEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewEntry> {
        return NSFetchRequest<NewEntry>(entityName: "NewEntry")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?

}

extension NewEntry : Identifiable {

}
