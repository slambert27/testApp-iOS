//
//  ScorePageAppUITests.swift
//  ScorePageAppUITests
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import XCTest

class ScorePageAppUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        
        app.launch()
    }

    func testScoreCollectionView() {

        let scoresviewCollectionView = app.collectionViews["ScoresView"]
        let liveCount = scoresviewCollectionView.getLiveCells().count
        
        app.swipeUp()
        let upcomingCount = scoresviewCollectionView.getUpcomingCells().count

        XCTAssert(scoresviewCollectionView.exists)
        XCTAssertEqual(liveCount, 4)
        XCTAssertEqual(upcomingCount, 7)
    }
    
    func testLiveScoreCell() {
        
        let liveCell = app.collectionViews["ScoresView"].getLiveCells().firstMatch
        
        let homeText = liveCell.staticTexts["homeName"].label
        let homeScore = liveCell.staticTexts["homeScore"].label
        
        XCTAssertEqual(homeText, "BOS")
        XCTAssertEqual(homeScore, "5")
    }
    
    func testUpcomingScoreCell() {
        
        let upcomingCell = app.collectionViews["ScoresView"].getUpcomingCells().firstMatch
        
        let awayText = upcomingCell.staticTexts["awayName"].label
        let time = upcomingCell.staticTexts["startTime"].label
        
        XCTAssertEqual(awayText, "LAD")
        XCTAssertEqual(time, "7:10 PM")
    }
}
