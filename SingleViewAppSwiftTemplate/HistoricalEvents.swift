//
//  HistoricalEvents.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Joseph Heydorn on 4/24/19.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation
import GameKit

struct EventPrep {
    let event: String
    let year: Int
}

class EventList {
    var eventGroup = [
        EventPrep(event: "WW2 Began", year: 1939),
        EventPrep(event: "The Great Depression Began", year: 1929),
        EventPrep(event: "Hindenburg Zeppelin Fell", year: 1933),
        EventPrep(event: "The Civil War Began", year: 1861),
        EventPrep(event: "First Man on the Moon", year: 1969),
        EventPrep(event: "First Black US President", year: 2008),
        EventPrep(event: "World Trade Center Fell", year: 2001),
        EventPrep(event: "Christopher Columbus Set Sail", year: 1492),
        EventPrep(event: "First Superbowl", year: 1967),
        EventPrep(event: "Disneyland Opened", year: 1955),
        EventPrep(event: "Lightbulb was Invented", year: 1879),
        EventPrep(event: "The First Apple Mavintosh Computer was Released", year: 1984),
        EventPrep(event: "California Became a State", year: 1849),
        EventPrep(event: "The Boston Tea Party", year: 1773),
        EventPrep(event: "Korean War", year: 1950),
        EventPrep(event: "Vietnam Freed from the French", year: 1973),
        EventPrep(event: "Woman Sufferage Movement", year: 1920),
        EventPrep(event: "African Americans Got the Right to Vote in the US", year: 1870),
        EventPrep(event: "Martin Luther King Jr. Gave his \"I have a Dream\" Speach", year: 1963),
        EventPrep(event: "The Berlin Wall was Torn Down", year: 1989),
        EventPrep(event: "The Printing Press was Created", year: 1440),
        EventPrep(event: "The Renaissance Era Began", year: 1300),
        EventPrep(event: "The Mona Lisa was Created", year: 1503),
        EventPrep(event: "The First US Map was Created", year: 1784),
        EventPrep(event: "The Black Plague Ran Through Europe", year: 1346)
        ]
    //Shuffle The Questions
    func shuffleQuestions() {
        eventGroup.shuffle()
    }
    //Grabbing Each Question
    func factSpot1Providor() -> String {
        let questionMixer = eventGroup[0]
        let choice1 = questionMixer.event
        return choice1
    }
    func factSpot2Providor() -> String {
        let questionMixer = eventGroup[1]
        let choice2 = questionMixer.event
        return choice2
    }
     
    func factSpot3Providor() -> String {
        let questionMixer = eventGroup[2]
        let choice3 = questionMixer.event
        return choice3
    }
    func factSpot4Providor() -> String {
        let questionMixer = eventGroup[3]
        let choice4 = questionMixer.event
        return choice4
    }
    //Check for answers
    func checkDate1() -> Int{
        let answerFinder = eventGroup[0]
        let date1 = answerFinder.year
        return date1
    }
    func checkDate2() -> Int{
        let answerFinder = eventGroup[1]
        let date2 = answerFinder.year
        return date2
    }
    func checkDate3() -> Int{
        let answerFinder = eventGroup[2]
        let date3 = answerFinder.year
        return date3
    }
    func checkDate4() -> Int{
        let answerFinder = eventGroup[3]
        let date4 = answerFinder.year
        return date4
    }
}
