//
//  EventPresenter.swift
//  ScorePageApp
//
//  Created by Samuel Lambert on 5/15/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct EventPresenter {
    
    let event: Event
    
    var header: String {
        return event.awayTeam.abbreviation + " @ " + event.homeTeam.abbreviation
    }
    
    var homeLogo: UIImage {
        return event.homeTeam.logo
    }
    
    var homeName: String {
        return event.homeTeam.name.uppercased()
    }
    
    var awayLogo: UIImage {
        return event.awayTeam.logo
    }
    
    var awayName: String {
        return event.awayTeam.name.uppercased()
    }
    
    var awayRecord: String {
        let wins = String(event.awayTeam.wins)
        let losses = String(event.awayTeam.losses)
        if let draws = event.awayTeam.draws {
            return wins + "-" + losses + "-" + String(draws)
        } else {
            return wins + "-" + losses
        }
    }
    
    var homeRecord: String {
        let wins = String(event.homeTeam.wins)
        let losses = String(event.homeTeam.losses)
        if let draws = event.homeTeam.draws {
            return wins + "-" + losses + "-" + String(draws)
        } else {
            return wins + "-" + losses
        }
    }
}
