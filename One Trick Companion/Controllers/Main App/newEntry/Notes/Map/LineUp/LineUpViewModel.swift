//
//  LineUpViewModel.swift
//  One Trick Companion
//
//  Created by adam smith on 3/22/22.
//

import Foundation
import UIKit

protocol LineUpViewModelDelegate: AnyObject {
    func overviewImagesHasdata()
    func encountered(_ error: Error)
}

class LineUpViewModel {
    
    //MARK: - Properties
    var mapData: MapData?
    var agentData: AgentData?
    var lineup: Lineup?
    weak var delegate: LineUpViewModelDelegate?
    
    init(delegate: LineUpViewModelDelegate) {
        self.delegate = delegate
    }

    
    init(map: MapData? = nil, agent: AgentData? = nil, lineup: Lineup? = nil) {
        self.mapData = map
        self.agentData = agent
        self.lineup = lineup
    }
    //MARK: - functions
    
    func saveLineup(instructions: String, title: String) {
        if let lineup = lineup {
            lineup.instructions = instructions
            lineup.title = title
        } else {
            self.lineup = Lineup(agentImage: agentData!.displayIconSmall, mapName: mapData!.displayName, instructions: instructions, title: title)
        }
        do {
            try CoreDataStack.context.save()
        } catch {
            print(error)
        }
    }
}
