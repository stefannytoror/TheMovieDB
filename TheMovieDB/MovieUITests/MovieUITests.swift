//
//  MovieUITests.swift
//  TheMovieUITests
//
//  Created by Stefanny Toro Ramirez on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
import Swifter

class MovieUITests: XCTestCase {
    let app = XCUIApplication()
    let swifterStubs = SwifterHttpStubs()
    
    
    override func setUp() {
        super.setUp()
        app.launchEnvironment = ["BASE_URL" : "http://localhost:8080"]
        continueAfterFailure = false
        configureMockServer()
        app.launch()
        
    }
    func configureMockServer() {
        swifterStubs.startServer()
        swifterStubs.setupStub(url:"/movie/301528/credits?api_key=1f4d7de5836b788bdfd897c3e0d0a24b", filename: "moviesCredits", method: .GET)
        swifterStubs.setupStub(url:"/movie/now_playing?api_key=1f4d7de5836b788bdfd897c3e0d0a24b", filename: "moviesList", method: .GET)
    }
    
    override func tearDown() {
        super.tearDown()
        swifterStubs.tearDown()
    }
    
    func testAppFlowWithSwifterStubs() {
        
        _ = app.alerts.element.waitForExistence(timeout: 5)
        
        app.tables["MovieTable"].cells["MovieCell 1"].tap()
         _ = app.alerts.element.waitForExistence(timeout: 5)
        app.buttons["Credits"].tap()
         _ = app.alerts.element.waitForExistence(timeout: 5)
    }
    
}
