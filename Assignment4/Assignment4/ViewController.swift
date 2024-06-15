//
//  ViewController.swift
//  Assignment4
//
//  Created by Zachary Langer on 6/12/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timeRemaining : Int?
    var musicTimeRemaining : Int? = 5
    var formattedTimeRemaining : String? = ""
    var timerRunning : Bool? = false
    var musicPlaying : Bool? = false
    
    var currentTimer = Timer()
    var timerRemaining = Timer()
    var musicTimerRemaining = Timer()
    var soundEffect : AVAudioPlayer!
    
    let path = Bundle.main.path(forResource: "587897__seth_makes_sounds__lofi", ofType:"wav")!
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var currentTimeDisplay: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var timerCountdown: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCurrentTime()
    }
    
    func getCurrentTime() {
        currentTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime), userInfo: nil, repeats: true)
    }

    
    @objc func currentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss"
        currentTimeDisplay.text = formatter.string(from: Date())
        if (Calendar.current.component( .hour, from: Date()) < 12) {
            background.image = UIImage(named: "light-gradients")
        } else {
            background.image = UIImage(named: "dark-gradients")
        }
    }

    @IBAction func timerChanged(_ sender: UIDatePicker) {
        if (!timerRunning!) {
            timeRemaining = Int(sender.countDownDuration)
        }
    }
    
    @IBAction func startStopButtonPushed(_ sender: UIButton) {
        timerRemaining.invalidate()
        musicTimerRemaining.invalidate()
        soundEffect?.stop()

        if (timerRunning!) {
            // Stop the timer
            timerRunning = false
            // Enable selection
            timePicker.isUserInteractionEnabled = true
            startStopButton.setTitle("Start Timer", for: .normal)
            
        } else if (musicPlaying!) {
            // Stop the music
            musicTimeRemaining = 0
            musicPlaying = false
            
            // Enable selection
            timePicker.isUserInteractionEnabled = true
            startStopButton.setTitle("Start Timer", for: .normal)
            
        } else {
            // Start the timer
            timeRemaining = Int(timePicker.countDownDuration)
            formattedTimeRemaining = formatTime(time: timeRemaining!)
            timerCountdown.text = "Time Remaining: \(formattedTimeRemaining!)"
            timerRemaining = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTimeRemaining), userInfo: nil, repeats: true)
            timerRunning = true
            timePicker.isUserInteractionEnabled = false
            startStopButton.setTitle("Stop Timer", for: .normal)
            
        }
    }
    
    @objc func currentTimeRemaining() {
        if (timeRemaining! > 0) {
            timeRemaining! -= 1
            formattedTimeRemaining = formatTime(time: timeRemaining!)
            timerCountdown.text = "Time Remaining: \(formattedTimeRemaining!)"
        } else {
            timerRemaining.invalidate()
            musicTimeRemaining = 5
            timerRunning = false
            musicPlaying = true
            musicTimerRemaining = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentMusicTimeRemaining), userInfo: nil, repeats: true)
            
            do {
                let url = URL(fileURLWithPath: path)
                soundEffect = try AVAudioPlayer(contentsOf: url)
                soundEffect.play()
                startStopButton.setTitle("Stop Music", for: .normal)
            } catch {
                print("Audio file not found!")
            }
            
            startStopButton.setTitle("Stop Music", for: .normal)
        }
    }
    
    @objc func currentMusicTimeRemaining() {
        if (musicTimeRemaining! > 0) {
            musicTimeRemaining! -= 1
        } else {
            musicTimerRemaining.invalidate()
            soundEffect?.stop()
            musicPlaying = false
            startStopButton.setTitle("Start Timer", for: .normal)
        }
    }
    
    func formatTime(time: Int) -> String {
        let hours = time / 3600
        let minutes = time / 60 % 60
        let seconds = time % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

