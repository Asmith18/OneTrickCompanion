//
//  NewEntryViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/27/22.
//

import Foundation
import CoreData

protocol NewEntryViewModelDelegate: AnyObject {
    func LineupsHasData()
    func encounteredError(_ error: Error)
}

class NewEntryViewMdoel {
    
    private lazy var fetchRequest: NSFetchRequest<Lineup> = {
        let fetchRequest = NSFetchRequest<Lineup>(entityName: "Lineup")
        return fetchRequest
    }()
    var lineups: [Lineup] = []

    weak var delegate: NewEntryViewModelDelegate?
    
    init(delegate: NewEntryViewModelDelegate) {
        self.delegate = delegate
        fetchLineup()
    }
    
    func createLineup(title: String) {
        Lineup(title: title)
        saveLineup()
        fetchLineup()
    }
    
    func saveLineup() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print(error)
        }
    }
    
    func deleteLineup(lineup: Lineup) {
            try CoreDataStack.context.delete(lineup)
            saveLineup()
            fetchLineup()
    }
    
    func fetchLineup() {
        self.lineups = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.delegate?.LineupsHasData()
    }
}
