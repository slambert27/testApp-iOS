//
//  BaseballPresenter.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct BaseballPresenter {
    let event: BaseballEvent
    
    var state: EventState {
        return event.state
    }
    
    func getHomeTeam() -> (UIImage, String) {
        return (event.homeTeam.logo, event.homeTeam.abbreviation)
    }
    
    func getAwayTeam() -> (UIImage, String) {
        return (event.awayTeam.logo, event.awayTeam.abbreviation)
    }

}
