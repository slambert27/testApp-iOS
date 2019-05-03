//
//  XCUIExtenstions.swift
//  ScorePageAppUITests
//
//  Created by Samuel Lambert on 5/3/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import XCTest

extension XCUIElement {
    
    func getLiveCells() -> XCUIElementQuery {
        return cells.matching(identifier: "liveCell")
    }
    
    func getUpcomingCells() -> XCUIElementQuery {
        return cells.matching(identifier: "upcomingCell")
    }
}
