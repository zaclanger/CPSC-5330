//
//  ViewController.swift
//  Assignment5
//
//  Created by Zachary Langer on 6/18/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var storyText: UILabel!
    @IBOutlet weak var prevStory: UIButton!
    @IBOutlet weak var nextStory: UIButton!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    
    
    
    var explorationLogic = ExplorationLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    @IBAction func loadPrevText(_ sender: UIButton) {
        explorationLogic.prevTextIndex()
        updateUI()
    }
    
    @IBAction func loadNextText(_ sender: UIButton) {
        explorationLogic.nextTextIndex()
        updateUI()
    }
    
    @IBAction func loadChoiceOne(_ sender: UIButton) {
        explorationLogic.chooseOne()
        updateUI()
    }
    
    @IBAction func loadChoiceTwo(_ sender: UIButton) {
        explorationLogic.chooseTwo()
        updateUI()
    }
    
    @objc func updateUI() {
        
        // Scene text
        storyText.text = explorationLogic.getSceneText()
        
        // Scene background
        backgroundImage.image = explorationLogic.getBackground()
        
        // Enable or disable text navigation
        if (explorationLogic.hasPrevText()) {
            prevStory.alpha = 1.0
            prevStory.isEnabled = true
        } else {
            prevStory.alpha = 0.0
            prevStory.isEnabled = false
        }
        
        if (explorationLogic.hasNextText()) {
            nextStory.alpha = 1.0
            nextStory.isEnabled = true
        } else {
            nextStory.alpha = 0.0
            nextStory.isEnabled = false
        }
        
        // Show button text
        if (!explorationLogic.isEnd()) {
            choiceOneButton.setTitle(explorationLogic.getChoiceOne(), for: .normal)
            choiceOneButton.alpha = 1.0
            choiceOneButton.isEnabled = true
            choiceTwoButton.setTitle(explorationLogic.getChoiceTwo(), for: .normal)
            choiceTwoButton.alpha = 1.0
            choiceTwoButton.isEnabled = true
        } else {
            choiceOneButton.alpha = 0.0
            choiceOneButton.isEnabled = false
            choiceTwoButton.alpha = 0.0
            choiceTwoButton.isEnabled = false
        }
    }
}

