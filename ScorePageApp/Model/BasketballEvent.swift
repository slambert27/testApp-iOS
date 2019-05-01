//
//  BasketballEvent.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import Foundation

struct BasketballEvent: Event {
    
    var homeTeam: Team
    var awayTeam: Team
    
    var startTime: String?
    var station: String?
    
    var favorite: String?
    var overUnder: Double?
    
    var state: EventState
    
    var homeScore: Int?
    var awayScore: Int?
    
    var period: String?
    var gameTime: String?
    
    init(home: Team, away: Team, time: String) {
        homeTeam = home
        awayTeam = away
        startTime = time
        station = "FOX"
        favorite = home.abbreviation
        overUnder = 0.0
        state = .upcoming
    }
    
    init(home: Team, away: Team, homeScore: Int, awayScore: Int, period: String, gameTime: String) {
        homeTeam = home
        awayTeam = away
        state = .live
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.period = period
        self.gameTime = gameTime
    }
    
    func getTeams() -> (Team, Team) {
        return (homeTeam, awayTeam)
    }
}
