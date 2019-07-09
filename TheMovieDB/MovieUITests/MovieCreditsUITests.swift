//
//  MovieCreditsUITests.swift
//  MovieUITests
//
//  Created by Stefanny Toro Ramirez on 7/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest

class MovieCreditsUITests: XCTestCase {
    let app = XCUIApplication()
    let swifterStubs = SwifterHttpStubs()
    let json = """
    {
            "vote_count": 1066,
            "id": 301528,
            "vote_average": 7.8,
            "title": "Toy Story 2",
            "popularity": 278.385,
            "poster_path": "/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg",
            "backdrop_path": "/m67smI1IIMmYzCl9axvKNULVKLr.jpg",
            "overview": "Woody has always been confident about his place in the world.",
            "release_date": "2019-06-19"
        }
    """
    
    override func setUp() {
        app.launchEnvironment = ["BASE_URL" : "http://localhost:8080","JSON" : json]
        configureMockServer()
        continueAfterFailure = false
        app.launchArguments.append("isUITesting")
        
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        swifterStubs.tearDown()
    }
    
    func configureMockServer() {
        swifterStubs.startServer()
        swifterStubs.setupStub(url:"/movie/301528/credits?api_key=1f4d7de5836b788bdfd897c3e0d0a24b", filename: "moviesCredits", method: .GET)
    }
    
    func testExample() {
        
        //app.tables["MovieTable"].cells["MovieCell 1"].tap()
//        app.buttons["Credits"].tap()
        _ = app.alerts.element.waitForExistence(timeout: 5)
        let actorName = app.staticTexts["Tom Hanks"].label
        
        XCTAssertEqual(actorName, "Tom Hanks")
        
    }

}
