//
//  Event.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import Foundation

enum EventState {
    case upcoming
    case live
    case final
}

protocol Event {
    
    var homeTeam: Team { get }
    var awayTeam: Team { get }
    
    var startTime: String? { get }
    var station: String? { get }
    
    var favorite: Team? { get }
    var spread: Double? { get }
    var overUnder: Double? { get }
    
    var state: EventState { get }
    
    var homeScore: Int? { get }
    var awayScore: Int? { get }
    
    var period: String? { get }
    var gameTime: String? { get }
    
    func getTeams() -> (Team, Team)
}
