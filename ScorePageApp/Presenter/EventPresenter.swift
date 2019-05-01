//
//  EventPresenter.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct EventPresenter {
    let event: Event
    
    var state: EventState {
        return event.state
    }
    
    func getHomeTeam() -> (UIImage, String) {
        return (event.homeTeam.logo, event.homeTeam.abbreviation)
    }
    
    func getAwayTeam() -> (UIImage, String) {
        return (event.awayTeam.logo, event.awayTeam.abbreviation)
    }
    
    func getScores() -> (String, String) {
        if let away = event.awayScore, let home = event.homeScore {
            return (String(away), String(home))
        } else {
            return ("", "")
        }
    }
    
    func getClock() -> String {
        let period = event.period ?? ""
        let time = event.gameTime ?? ""
        return period + " " + time
    }
    
    func getStation() -> String {
        return event.station ?? ""
    }
    
    func getTime() -> String {
        return event.startTime ?? ""
    }
    
    func getFavorite() -> String {
        if let fav = event.favorite?.abbreviation, let spread = event.spread {
            return fav + " -" + String(spread)
        } else {
            return ""
        }
    }
    
    func getOverUnder() -> String {
        if let oU = event.overUnder {
            return "O/U " + String(oU)
        } else {
            return ""
        }
    }
}
