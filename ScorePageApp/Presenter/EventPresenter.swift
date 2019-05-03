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
    
    var homeTeam: (UIImage, String) {
        return (event.homeTeam.logo, event.homeTeam.abbreviation)
    }
    
    var awayTeam: (UIImage, String) {
        return (event.awayTeam.logo, event.awayTeam.abbreviation)
    }
    
    var scores: (String, String) {
        if let away = event.awayScore, let home = event.homeScore {
            return (String(away), String(home))
        } else {
            return ("", "")
        }
    }
    
    var clock: String {
        let period = event.period ?? ""
        let time = event.gameTime != nil ? " " + event.gameTime! : ""
        return period + time
    }
    
    var station: String {
        return event.station ?? ""
    }
    
    var time: String {
        return event.startTime ?? ""
    }
    
    var favorite: String {
        if let fav = event.favorite?.abbreviation, let spread = event.spread {
            return fav + " -" + String(spread)
        } else {
            return ""
        }
    }
    
    var overUnder: String {
        if let oU = event.overUnder {
            return "O/U " + String(oU)
        } else {
            return ""
        }
    }
}
