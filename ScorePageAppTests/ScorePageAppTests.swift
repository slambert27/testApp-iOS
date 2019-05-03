//
//  ScorePageAppTests.swift
//  ScorePageAppTests
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import XCTest
@testable import ScorePageApp

class PresenterTests: XCTestCase {

    let baseballEvent = BaseballEvent(home: Team(location: "Boston", name: "Red Sox", abbreviation: "BOS", logo: UIImage(named: "redsox.png")!), away: Team(location: "New York", name: "Yankees", abbreviation: "NYY", logo: UIImage(named: "yankees.png")!), homeScore: 5, awayScore: 3, period: "BOT 2")
    
    var presenter: EventPresenter?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = EventPresenter(event: baseballEvent)
        XCTAssertNotNil(presenter)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHomeTeam() {
        let homeTeam = presenter!.homeTeam
        XCTAssertEqual(homeTeam.0, UIImage(named: "redsox.png")!)
        XCTAssertEqual(homeTeam.1, "BOS")
    }
    
    func testScores() {
        let scores = presenter!.scores
        XCTAssertEqual(scores.0, "3")
        XCTAssertEqual(scores.1, "5")
    }
    
    func testClock() {
        let clock = presenter!.clock
        XCTAssertEqual(clock, "BOT 2")
    }
    
    func testFavorite() {
        let favorite = presenter!.favorite
        XCTAssertEqual(favorite, "")
    }
    
    func testOverUnder() {
        let overUnder = presenter!.overUnder
        XCTAssertEqual(overUnder, "")
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
