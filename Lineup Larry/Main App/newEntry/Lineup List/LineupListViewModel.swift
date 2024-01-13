//
//  NewEntryViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/27/22.
//

import Foundation
import CoreData
import UIKit

class LineupListViewModel {
    
    var agent: AgentData?
    var fetchedResultsController: NSFetchedResultsController<Lineup>
    
    private lazy var fetchRequest: NSFetchRequest<Lineup> = {
        let fetchRequest = NSFetchRequest<Lineup>(entityName: "Lineup")
        return fetchRequest
    }()
    
    init() {
        let request: NSFetchRequest<Lineup> = Lineup.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        let resultController: NSFetchedResultsController<Lineup> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController = resultController
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("failed to fetch data")
        }
    }
    
    func deleteLineup(lineup: Lineup) {
        CoreDataStack.context.delete(lineup)
        do {
           try CoreDataStack.context.save()
        } catch {
            print("failed to save data")
        }
    }
}
