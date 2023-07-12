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
    var tempArray: [UIImage] = []
    var mapData: MapData?
    var agent: AgentData?
    var lineup: Lineup?
    weak var delegate: LineUpViewModelDelegate?
    
    init(delegate: LineUpViewModelDelegate?) {
        self.delegate = delegate
    }
    
    init(map: MapData? = nil, agent: AgentData? = nil, lineup: Lineup? = nil) {
        self.mapData = map
        self.agent = agent
        self.lineup = lineup
        self.tempArray = lineup?.overviewImages?.compactMap {  UIImage(data: $0 ) } ?? []
    }

    //MARK: - functions
    
    func saveLineup(instructions: String, title: String) {
        if let lineup = lineup {
            lineup.instructions = instructions
            lineup.title = title
            lineup.overviewImages = tempArray.compactMap {  $0.pngData() }
            lineup.agentImage = lineup.agentImage
        } else {
            self.lineup = Lineup(agentImage: agent!.displayIconSmall!, mapName: mapData!.displayName ?? "", instructions: instructions, title: title, overviewImages: tempArray.compactMap {  $0.pngData() })
        }
        do {
            try CoreDataStack.context.save()
        } catch {
            print(error)
        }
    }
}
