//
//  NewEntryViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/27/22.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

protocol LineupListViewModelDelegate: AnyObject {
    func LineupsHasData()
    func encounteredError(_ error: Error)
}

class LineupListViewMdoel {
    
    private lazy var fetchRequest: NSFetchRequest<Lineup> = {
        let fetchRequest = NSFetchRequest<Lineup>(entityName: "Lineup")
        return fetchRequest
    }()
    var lineups: [Lineup] = []
    
    weak var delegate: LineupListViewModelDelegate?
    
    init(delegate: LineupListViewModelDelegate) {
        self.delegate = delegate
        fetchLineup()
    }
    
//    func saveLineup() {
//
//        do {
//            try CoreDataStack.context.save()
//        } catch {
//            print(error)
//        }
//    }
    
    func deleteLineup(lineup: Lineup) {
            try CoreDataStack.context.delete(lineup)
            fetchLineup()
    }
    
    func fetchLineup() {
        let lineups = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.lineups = lineups.reversed()
        self.delegate?.LineupsHasData()
    }
}
