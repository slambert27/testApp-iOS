//
//  Constants.swift
//  ScorePageApp
//
//  Created by Samuel Lambert on 5/1/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class Constants {
    
    static let teams: [Team] = [
        Team(location: "Boston", name: "Red Sox", abbreviation: "BOS", logo: UIImage(named: "redsox.png")!),
        Team(location: "New York", name: "Yankees", abbreviation: "NYY", logo: UIImage(named: "yankees.png")!),
        Team(location: "Cincinnati", name: "Reds", abbreviation: "CIN", logo: UIImage(named: "reds.png")!),
        Team(location: "St. Louis", name: "Cardinals", abbreviation: "STL", logo: UIImage(named: "cardinals.png")!),
        Team(location: "Chicago", name: "Bulls", abbreviation: "CHI", logo: UIImage(named: "bulls.png")!),
        Team(location: "Miami", name: "Heat", abbreviation: "MIA", logo: UIImage(named: "heat.png")!),
        Team(location: "Portland", name: "Trailblazers", abbreviation: "POR", logo: UIImage(named: "blazers")!),
        Team(location: "Golden State", name: "Warriors", abbreviation: "GSW", logo: UIImage(named: "warriors")!),
        Team(location: "Chicago", name: "Cubs", abbreviation: "CHI", logo: UIImage(named: "cubs.png")!),
        Team(location: "Los Angeles", name: "Dodgers", abbreviation: "LAD", logo: UIImage(named: "dodgers.png")!),
        Team(location: "Houston", name: "Astros", abbreviation: "HOU", logo: UIImage(named: "astros.png")!),
        Team(location: "Kansas City", name: "Royals", abbreviation: "KC", logo: UIImage(named: "royals.png")!),
        Team(location: "Los Angeles", name: "Angels", abbreviation: "LAA", logo: UIImage(named: "angels.png")!),
        Team(location: "Oakland", name: "Raiders", abbreviation: "OAK", logo: UIImage(named: "athletics.png")!),
        Team(location: "New York", name: "Knicks", abbreviation: "NYK", logo: UIImage(named: "knicks.png")!),
        Team(location: "Indiana", name: "Pacers", abbreviation: "IND", logo: UIImage(named: "pacers.png")!)
    ]
    
    static let eventList: [Event] = [
        BaseballEvent(home: teams[0], away: teams[1], homeScore: 5, awayScore: 3, period: "BOT 2"),
        BaseballEvent(home: teams[2], away: teams[3], homeScore: 2, awayScore: 0, period: "TOP 5"),
        BasketballEvent(home: teams[4], away: teams[5], homeScore: 91, awayScore: 80, period: "Q4", gameTime: "6:43"),
        BasketballEvent(home: teams[6], away: teams[7], homeScore: 11, awayScore: 17, period: "Q1", gameTime: "8:13"),
        BaseballEvent(home: teams[8], away: teams[9], time: "7:10 PM", station: "ESPN", favorite: teams[9], spread: 2.5, overUnder: 7.0),
        BaseballEvent(home: teams[10], away: teams[11], time: "7:10 PM", station: "MLB TV", favorite: teams[10], spread: 1.0, overUnder: 5.5),
        BaseballEvent(home: teams[12], away: teams[13], time: "10:10 PM", station: "FS1", favorite: teams[12], spread: 1.5, overUnder: 8.5),
        BasketballEvent(home: teams[14], away: teams[15], time: "7:30 PM", station: "NBA TV", favorite: teams[15], spread: 8.5, overUnder: 210.5),
        BaseballEvent(home: teams[8], away: teams[9], time: "7:10 PM", station: "ESPN", favorite: teams[9], spread: 2.5, overUnder: 7.0),
        BaseballEvent(home: teams[10], away: teams[11], time: "7:10 PM", station: "MLB TV", favorite: teams[10], spread: 1.0, overUnder: 5.5),
        BaseballEvent(home: teams[12], away: teams[13], time: "10:10 PM", station: "FS1", favorite: teams[12], spread: 1.5, overUnder: 8.5),
    ]
}
