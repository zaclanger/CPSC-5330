//
//  ExplorationLogic.swift
//  Assignment5
//
//  Created by Zachary Langer on 6/19/24.
//

import Foundation
import UIKit

struct ExplorationLogic {
    
    var sceneIndex : Int = 1
    var sceneTextIndex : Int = 0
    
    let sceneArray : [ExplorationScene] = [
            ExplorationScene(0,                 //Question index
                    ["Null"],                   //Scene text
                    "Choice One",               //Choice one
                    "Choice Two",               //Choice two
                    UIImage(named: "Room")!,  //Background image
                    0
                    ),
            ExplorationScene(1,                 //Question index
                    [
                        "You awaken on a tattered canvas mat in a dimly-lit room, surrounded by stone walls.",
                        "A hole in the ceiling allows the silver light of the moon in just enough to reveal a ladder leading down a hole in one corner of the room and a wooden door in the center of the wall opposite you.",
                        "Somewhere, you hear a faint scratching."
                    ],                          //Scene text
                    "Go down the ladder",       //Index 2
                    "Go through the door",      //Index 3
                    UIImage(named: "Room")!,  //Background image
                    0
                    ),
            ExplorationScene(2,                 //Question index
                    [
                        "Each rung creaks underfoot as you descend the rickety ladder. The moonlight fades above you as you go, replaced by an eery glow.",
                        "A sound echoes above - footsteps?",
                        "As you reach the solid ground, something begins to pull the ladder up and out of your hands, then through the hole.",
                        "Above, a shadow looks down, then steps away.",
                        "You’re at the end of a tunnel;  to your left and right are stacks of boxes and junk.",
                        "Suddenly, the scratching resumes ahead, quickly coming towards you."
                    ],            //Scene text
                    "Stand your ground",        //Index 4
                    "Hide behind the boxes",    //Index 5
                    UIImage(named: "Ladder")!,  //Background image
                    0
                    ),
            ExplorationScene(3,                 //Question index
                    [
                        "The door provides some resistance, but creaks open with a little force.",
                        "Outside is a courtyard full of flowers; hedges rise on two sides, and a large house stands opposite your room.",
                        "In the center, a pond reflects the evening sky."
                    ],            //Scene text
                    "Go to the house",          //Index 6
                    "Go to the pool",           //Index 7
                    UIImage(named: "Garden")!,  //Background image
                    0
                    ),
            ExplorationScene(4,                 //Question index
                    [
                        "A light illuminates a corner ahead as another figure comes into view. You look around and grab a broomstick, preparing to confront whatever is coming your way.",
                        "It rounds the corner and comes into view - barely more than a shadow in the glare of its torch, it pauses when it sees you … then throws something on the ground and scuttles quickly back the way it came."
                    ],            //Scene text
                    "Chase the shadow",         //Index 8
                    "Investigate the object",   //Index 9
                    UIImage(named: "Tunnel")!,  //Background image
                    0
                    ),
            ExplorationScene(5,                 //Question index
                    [
                        "You forget your pride and hide behind the boxes, ignoring the smell and listening for whatever may come.",
                        "You see light and shadows along the walls. The scratching just on the other side of the box, then it stops.",
                        "The shadow’s head pops raises, then turns one way, then the other. An inquisitive growl rises from the unseen throat."
                    ],                          //Scene text
                    "Wait for the shadow to leave", //Index 10
                    "Try to run past",              //Index 11
                    UIImage(named: "Tunnel")!,  //Background image
                    0
                    ),
            ExplorationScene(6,                 //Question index
                    [
                        "As you walk across the courtyard, you wonder who owns this estate. You don’t get the chance to consider too deeply, however, as the door behind you slams shut.",
                        "You turn and see a shadowy figure standing in front of the room you just left, staring but not moving."
                    ],                          //Scene text
                    "Run to the house",         //Index 12
                    "Call out to the figure",   //Index 13
                    UIImage(named: "House")!,  //Background image
                    0
                    ),
            ExplorationScene(7,                 //Question index
                    [
                        "You walk towards the pool, and you notice the beauty of the night. The moon was beautiful in the sky, but in the pool … it was transcendent.",
                        "It was hard to look away from. As you approached, you forgot about the room, the house, the scratching.",
                        "Behind you, a man’s voice calls out, 'Stop!'"
                    ],                          //Scene text
                    "Turn around",              //Index 14
                    "Get a closer look at the pool",    //Index 15
                    UIImage(named: "Pond")!,  //Background image
                    0
                    ),
            ExplorationScene(8,                   //Question index
                    [
                        "You give chase! You round the bend in the tunnel just in time to see the light fade around another turn, then another.",
                        "You pursue for several minutes, though time means little as the light grows faint in the distance. Then, it grows brighter, and brighter still, until you turn one final corner and find yourself standing in the light of day.",
                        "How long had you been underground?",
                        "You take a few steps forward into a field dotted with mustard weeds and wildflowers, then turn around to look at the cliffside you emerged from ...",
                        "only to find more empty field behind you, and no trace of a tunnel or torch or shadow.",
                        "You made it!"
                    ],                          //Scene text
                    "",
                    "",
                    UIImage(named: "Field")!,  //Background image
                    1
                    ),
            ExplorationScene(9,                   //Question index
                    [
                        "The light fades in the distance and the tunnel goes dark. You feel your way forward towards the object, stumbling as you go but never fully losing your footing.",
                        "Your fingers find something cold, metal … unknown. You try to lift it, only to find one end too heavy to raise.",
                        "The heavy end scrapes along the stone floor - a shiver runs down your spine as you realize the only warning you’d have of the shadows return was now in your hands.",
                        "You run back to the end of the tunnel and fall to the ground, waiting, listening, wondering if you were still alone in the dark.",
                        "You didn't make it..."
                    ],                          //Scene text
                    "",
                    "",
                    UIImage(named: "Dark")!,  //Background image
                    2
                    ),
            ExplorationScene(10,                   //Question index
                    [
                        "You curl into yourself, closing your eyes and hoping the shadow fades. You open them again just as it moves the boxes on the other side of the tunnel.",
                        "You hold your breath, but the shadow on the wall grows as it turns to your side.",
                        "The box behind you slides away, and you fall - before you hit the ground, you see the figure looming over you.",
                        "You didn't make it..."
                    ],                          //Scene text
                    "",
                    "",
                    UIImage(named: "Tunnel")!,  //Background image
                    2
                    ),
            ExplorationScene(11,                   //Question index
                    [
                        "You run! You round a bend in the tunnel just in time to see the light fade behind you. You run for several minutes, hitting walls but never stopping.",
                        "Then, a light in the distance grows brighter, and brighter still, until you turn one final corner and find yourself standing in the light of day.",
                        "How long had you been underground?",
                        "You take a few steps forward into a field dotted with mustard weeds and wildflowers, then turn around to look at the cliffside you emerged from...",
                        "only to find more empty field behind you, and no trace of a tunnel or torch or shadow.",
                        "You made it!"
                    ],                          //Scene text
                    "",
                    "",
                    UIImage(named: "Field")!,  //Background image
                    1
                    ),
            ExplorationScene(12,                  //Question index
                    [
                        "You run! You don’t know what the figure wants, but you don’t care to find out.",
                        "You glance back and feel the ground fall out from beneath you. Cold water comes up around you.",
                        "You kick, but the water doesn’t relent - a current brings you deeper. Above, the figure steps into view and watches as you sink.",
                        "You didn't make it..."
                    ],                          //Scene text
                    "",
                    "",
                    UIImage(named: "Pond")!,  //Background image
                    2
                    ),
            ExplorationScene(13,                  //Question index
                    [
                        "'Hey!' You yell to the figure. 'Whose house is this?'",
                        "'You aren’t supposed to be here,' a male voice calls back. 'It’s private property.'",
                        "'I’m not sure how I got here, I just woke up in that room.'",
                        "'Oh!' He steps forward, revealing himself to be an older man. 'I heard the door slam open and came. You’re the stranger.'",
                        "'The stranger?' Flashes of memory flicker back; your hand knocking on a door, the offer of a garden shed for the night.",
                        "'Come in,' he says. 'We’ll get you some tea and some food. You’ll be yourself in no time, and we’ll help you find your way.'",
                        "You made it!"
                    ],                          //Scene text
                    "",
                    "",
                    UIImage(named: "House")!,  //Background image
                    1
                    ),
            ExplorationScene(14,                  //Question index
                    [
                        "'Hey!' You yell to the figure, snapping out of your stupor. 'Whose house is this?'",
                        "'You aren’t supposed to be here,' a male voice calls back. 'It’s private property.'",
                        "'I’m not sure how I got here, I just woke up in that room.'",
                        "'Oh!' He steps forward, revealing himself to be an older man. 'I heard the door slam open and came. You’re the stranger.'",
                        "'The stranger?' Flashes of memory flicker back; your hand knocking on a door, the offer of a garden shed for the night.",
                        "'Come in,' he says. 'We’ll get you some tea and some food. You’ll be yourself in no time, and we’ll help you find your way.'",
                        "You made it!"
                    ],                          //Scene text
                    "",
                    "",
                    UIImage(named: "House")!,  //Background image
                    1
                    ),
            ExplorationScene(15,                  //Question index
                    [
                        "You can’t take your eyes off the pool. You get closer, closer…",
                        "The water is cool on your skin as you step into it. You go further in, deeper.",
                        "Above, a man steps into view, far out of reach above the surface of the water.",
                        "You didn't make it..."
                    ],                          //Scene text
                    "",
                    "",
                    UIImage(named: "Pond")!,  //Background image
                    2
                    )
            ]
    
    mutating func chooseOne() {
        sceneTextIndex = 0
        sceneIndex *= 2
    }
    
    mutating func chooseTwo() {
        sceneTextIndex = 0
        sceneIndex = (sceneIndex * 2) + 1
    }
    
    mutating func getNextScene() -> ExplorationScene {
        return sceneArray[sceneIndex]
    }
    
    func getChoiceOne() -> String {
        return sceneArray[sceneIndex].choiceOne
    }
    
    func getChoiceTwo() -> String {
        return sceneArray[sceneIndex].choiceTwo
    }
    
    func getBackground() -> UIImage {
        return sceneArray[sceneIndex].background
    }
    
    func isEnd() -> Bool {
        return sceneArray[sceneIndex].endVal != 0
    }
    
    func isWin() -> Bool {
        return sceneArray[sceneIndex].endVal == 1
    }
    
    func isLoss() -> Bool {
        return sceneArray[sceneIndex].endVal == 2
    }
    
    func getSceneText() -> String {
        return sceneArray[sceneIndex].scenario[sceneTextIndex]
    }
    
    func hasPrevText() -> Bool {
        return sceneTextIndex > 0
    }
    
    func hasNextText() -> Bool {
        return sceneTextIndex < (sceneArray[sceneIndex].scenario.count - 1)
    }
    
    mutating func prevTextIndex() {
        sceneTextIndex -= 1
    }
    
    mutating func nextTextIndex() {
        sceneTextIndex += 1
    }
    
}
