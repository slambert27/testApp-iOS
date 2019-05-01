//
//  BaseballEvent.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import Foundation

struct BaseballEvent: Event {
    
    var homeTeam: Team
    var awayTeam: Team
    
    var startTime: String?
    var station: String?
    
    var favorite: Team?
    var spread: Double?
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
        favorite = home
        spread = 1.0
        overUnder = 0.0
        state = .upcoming
    }
    
    init(home: Team, away: Team, time: String, station: String, favorite: Team, spread: Double, overUnder: Double) {
        homeTeam = home
        awayTeam = away
        startTime = time
        self.station = station
        self.favorite = favorite
        self.spread = spread
        self.overUnder = overUnder
        state = .upcoming
    }
    
    init(home: Team, away: Team, homeScore: Int, awayScore: Int, period: String) {
        homeTeam = home
        awayTeam = away
        state = .live
        self.homeScore = homeScore
        self.awayScore = awayScore
        self.period = period
        station = "FOX"
    }
    
    func getTeams() -> (Team, Team) {
        return (homeTeam, awayTeam)
    }
}
