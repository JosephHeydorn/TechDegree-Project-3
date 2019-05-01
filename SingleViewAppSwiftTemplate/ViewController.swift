//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerGame = 6
    var questionsAsked = 0
    var correctQuestions = 0
    
    var fact1: String?
    var fact2: String?
    var fact3: String?
    var fact4: String?
    
    var event1: Int = 0
    var event2: Int = 0
    var event3: Int = 0
    var event4: Int = 0
    
    var gameSound1: SystemSoundID = 0
    var gameSound2: SystemSoundID = 0
    
    var time = 60
    var timer = Timer()

    let eventProvidor = EventList()
    
    //Declaring All the Buttons and Labels
    @IBOutlet weak var timerClock: UILabel!
    @IBOutlet weak var factSpot1: UILabel!
    @IBOutlet weak var factSpot2: UILabel!
    @IBOutlet weak var factSpot3: UILabel!
    @IBOutlet weak var factSpot4: UILabel!
    @IBOutlet weak var gameStart: UIButton!
    @IBOutlet weak var fact1Down: UIButton!
    @IBOutlet weak var fact2Up: UIButton!
    @IBOutlet weak var fact2Down: UIButton!
    @IBOutlet weak var fact3Up: UIButton!
    @IBOutlet weak var fact3Down: UIButton!
    @IBOutlet weak var fact4Up: UIButton!
    @IBOutlet weak var NextRoundWrong: UIButton!
    @IBOutlet weak var NextRoundRight: UIButton!
    @IBOutlet weak var scoreDisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayPrep()
        gameHidden()
        loadGameSounds()
        scoreDisplay.isHidden = true
    }
    func loadGameSounds() {
        //Correct Ding
        let path1 = Bundle.main.path(forResource: "CorrectDing", ofType: "wav")
        let soundUrl1 = URL(fileURLWithPath: path1!)
        AudioServicesCreateSystemSoundID(soundUrl1 as CFURL, &gameSound1)
        //Incorrect Buzz
        let path2 = Bundle.main.path(forResource: "IncorrectBuzz", ofType: "wav")
        let soundUrl2 = URL(fileURLWithPath: path2!)
        AudioServicesCreateSystemSoundID(soundUrl2 as CFURL, &gameSound2)
    }
    func correctDing() {
        AudioServicesPlaySystemSound(gameSound1)
    }
    func incorrectBuzz() {
        AudioServicesPlaySystemSound(gameSound2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //All Preperation Functions
    func displayPrep() {
        self.factSpot1.layer.cornerRadius = 10
        self.factSpot2.layer.cornerRadius = 10
        self.factSpot3.layer.cornerRadius = 10
        self.factSpot4.layer.cornerRadius = 10
    }
    //Game Processing Functions
    func displayGameScore() {
        scoreDisplay.isHidden = false
    }
    func gameHidden() {
        factSpot1.isHidden = true
        factSpot2.isHidden = true
        factSpot3.isHidden = true
        factSpot4.isHidden = true
        timerClock.isHidden = true
        fact1Down.isHidden = true
        fact2Up.isHidden = true
        fact2Down.isHidden = true
        fact3Up.isHidden = true
        fact3Down.isHidden = true
        fact4Up.isHidden = true
        NextRoundWrong.isHidden = true
        NextRoundRight.isHidden = true
    }
    func generateNewQuestion() {
        timer.invalidate()
        eventProvidor.shuffleQuestions()
        fact1 = eventProvidor.factSpot1Providor()
        fact2 = eventProvidor.factSpot2Providor()
        fact3 = eventProvidor.factSpot3Providor()
        fact4 = eventProvidor.factSpot4Providor()
        event1 = eventProvidor.checkDate1()
        event2 = eventProvidor.checkDate2()
        event3 = eventProvidor.checkDate3()
        event4 = eventProvidor.checkDate4()
        
        factSpot1.text = fact1
        factSpot2.text = fact2
        factSpot3.text = fact3
        factSpot4.text = fact4
        timerClock.isHidden = false
        checkGameStatus()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
    }
    func gamePrepAndBegin() {
        timerClock.isHidden = false
        factSpot1.isHidden = false
        factSpot2.isHidden = false
        factSpot3.isHidden = false
        factSpot4.isHidden = false
        fact1Down.isHidden = false
        fact2Up.isHidden = false
        fact2Down.isHidden = false
        fact3Up.isHidden = false
        fact3Down.isHidden = false
        fact4Up.isHidden = false
        gameStart.isHidden = true
        scoreDisplay.isHidden = true
        generateNewQuestion()
    }
    func countDown() {
        time -= 1
        timerClock.text = ("\(time)")
        checkTime()
    }
    func checkTime() {
        if time == 0 {
            timerClock.isHidden = true
            NextRoundWrong.isHidden = false
            incorrectBuzz()
        }
    }
    
    //FIXME: Timer shows -1 when pressing new round button
    @IBAction func gameStarter(_ sender: UIButton) {
        time = 60
        timerClock.text = "60"
        gamePrepAndBegin()
        correctQuestions = 0
        questionsAsked = 0
    }
    //Right or Wrong button Functionalities
    @IBAction func nextRoundWrongPressed(_ sender: UIButton) {
        time = 60
        timerClock.text = "60"
        questionsAsked += 1
        generateNewQuestion()
        NextRoundWrong.isHidden = true
    }
    @IBAction func nextRoundRightPressed(_ sender: UIButton) {
        time = 60
        timerClock.text = "60"
        questionsAsked += 1
        correctQuestions += 1
        generateNewQuestion()
        NextRoundRight.isHidden = true
    }
    
   // Below are all the button functionalities for swapping the text
    @IBAction func fact1DownPress(_ sender: UIButton) {
        let tempHolder = fact1
        let tempEvent = event1
        fact1 = fact2
        event1 = event2
        event2 = tempEvent
        fact2 = tempHolder
        factSpot1.text = fact1
        factSpot2.text = fact2
        sender.setImage(UIImage(named: "down_full_selected"), for: .highlighted)
    }
    @IBAction func fact2UpPress(_ sender: UIButton) {
        let tempHolder = fact1
        let tempEvent = event1
        fact1 = fact2
        event1 = event2
        event2 = tempEvent
        fact2 = tempHolder
        factSpot1.text = fact1
        factSpot2.text = fact2
        sender.setImage(UIImage(named: "up_half_selected"), for: .highlighted)
    }
    @IBAction func fact2DownPress(_ sender: UIButton) {
        let tempHolder = fact2
        let tempEvent = event2
        fact2 = fact3
        event2 = event3
        event3 = tempEvent
        fact3 = tempHolder
        factSpot2.text = fact2
        factSpot3.text = fact3
        sender.setImage(UIImage(named: "down_half_selected"), for: .highlighted)
    }
    @IBAction func fact3UpPress(_ sender: UIButton) {
        let tempHolder = fact2
        let tempEvent = event2
        fact2 = fact3
        event2 = event3
        event3 = tempEvent
        fact3 = tempHolder
        factSpot2.text = fact2
        factSpot3.text = fact3
        sender.setImage(UIImage(named: "up_half_selected"), for: .highlighted)
    }
    @IBAction func fact3DownPress(_ sender: UIButton) {
        let tempHolder = fact3
        let tempEvent = event3
        fact3 = fact4
        event3 = event4
        event4 = tempEvent
        fact4 = tempHolder
        factSpot3.text = fact3
        factSpot4.text = fact4
        sender.setImage(UIImage(named: "down_half_selected"), for: .highlighted)
    }
    @IBAction func fact4UpPress(_ sender: UIButton) {
        let tempHolder = fact3
        let tempEvent = event3
        fact3 = fact4
        event3 = event4
        event4 = tempEvent
        fact4 = tempHolder
        factSpot3.text = fact3
        factSpot4.text = fact4
        sender.setImage(UIImage(named: "up_full_selected"), for: .highlighted)
    }
    
    //Declaring how many rounds are played to display score
    func checkGameStatus() {
        if questionsAsked == questionsPerGame {
            time = -1
            gameHidden()
            displayGameScore()
            scoreDisplay.text = ("Your Score Is \(correctQuestions)/6")
            gameStart.isHidden = false
        }
    }
    
    //Shaking Phone Motion
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            if (event1 > event2) && (event2 > event3) && (event3 > event4) {
                timerClock.isHidden = true
                NextRoundRight.isHidden = false
                correctDing()
                time = -1
            } else {
                timerClock.isHidden = true
                NextRoundWrong.isHidden = false
                incorrectBuzz()
                time = -1
            }
        }
    }
}
