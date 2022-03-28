//
//  Lineup+CoreDataProperties.swift
//  One Trick Companion
//
//  Created by adam smith on 3/27/22.
//
//

import Foundation
import CoreData
import UIKit


extension Lineup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lineup> {
        return NSFetchRequest<Lineup>(entityName: "Lineup")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var agentImage: Data?
    @NSManaged public var mapName: String?
    @NSManaged public var instructions: String?
    @NSManaged public var overviewImages: NSOrderedSet?

}

// MARK: Generated accessors for overviewImages
extension Lineup {

    @objc(insertObject:inOverviewImagesAtIndex:)
    @NSManaged public func insertIntoOverviewImages(_ value: Lineup, at idx: Int)

    @objc(removeObjectFromOverviewImagesAtIndex:)
    @NSManaged public func removeFromOverviewImages(at idx: Int)

    @objc(insertOverviewImages:atIndexes:)
    @NSManaged public func insertIntoOverviewImages(_ values: [Lineup], at indexes: NSIndexSet)

    @objc(removeOverviewImagesAtIndexes:)
    @NSManaged public func removeFromOverviewImages(at indexes: NSIndexSet)

    @objc(replaceObjectInOverviewImagesAtIndex:withObject:)
    @NSManaged public func replaceOverviewImages(at idx: Int, with value: Lineup)

    @objc(replaceOverviewImagesAtIndexes:withOverviewImages:)
    @NSManaged public func replaceOverviewImages(at indexes: NSIndexSet, with values: [Lineup])

    @objc(addOverviewImagesObject:)
    @NSManaged public func addToOverviewImages(_ value: Lineup)

    @objc(removeOverviewImagesObject:)
    @NSManaged public func removeFromOverviewImages(_ value: Lineup)

    @objc(addOverviewImages:)
    @NSManaged public func addToOverviewImages(_ values: NSOrderedSet)

    @objc(removeOverviewImages:)
    @NSManaged public func removeFromOverviewImages(_ values: NSOrderedSet)

}

extension Lineup : Identifiable {

}
