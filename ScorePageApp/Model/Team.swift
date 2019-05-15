//
//  Team.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct Team {
    let location: String
    let name: String
    let abbreviation: String
    let logo: UIImage
    let wins: Int
    let losses: Int
    let draws: Int?
    
    init(location: String, name: String, abbreviation: String, logo: UIImage, wins: Int, losses: Int, draws: Int? = nil) {
        self.location = location
        self.name = name
        self.abbreviation = abbreviation
        self.logo = logo
        self.wins = wins
        self.losses = losses
        self.draws = draws
    }
}
