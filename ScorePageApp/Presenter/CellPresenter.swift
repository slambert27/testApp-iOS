//
//  EventPresenter.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct CellPresenter {
    
    let event: Event
    
    var state: EventState {
        return event.state
    }
    
    var homeLogo: UIImage {
        return event.homeTeam.logo
    }
    
    var homeName: String {
        return event.homeTeam.abbreviation
    }
    
    var awayLogo: UIImage {
        return event.awayTeam.logo
    }
    
    var awayName: String {
        return event.awayTeam.abbreviation
    }
    
    var awayScore: String {
        if let score = event.awayScore {
            return String(score)
        } else {
            return ""
        }
    }
    
    var homeScore: String {
        if let score = event.homeScore {
            return String(score)
        } else {
            return ""
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
