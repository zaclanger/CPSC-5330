//
//  ExplorationScene.swift
//  Assignment5
//
//  Created by Zachary Langer on 6/19/24.
//

import Foundation
import UIKit

struct ExplorationScene {
    
    init(_ indexIn : Int, _ scenarioIn : [String], _ choiceOneIn : String, _ choiceTwoIn : String, _ backgroundIn : UIImage, _ endValIn : Int) {
        index = indexIn
        choiceOneIndex = index * 2
        choiceTwoIndex = choiceOneIndex + 1
        scenario = scenarioIn
        choiceOne = choiceOneIn
        choiceTwo = choiceTwoIn
        background = backgroundIn
        endVal = endValIn
    }
    
    var index : Int
    var scenario : [String]
    var choiceOne : String
    var choiceOneIndex : Int
    var choiceTwo : String
    var choiceTwoIndex : Int
    var background : UIImage
    var endVal : Int
    
}
