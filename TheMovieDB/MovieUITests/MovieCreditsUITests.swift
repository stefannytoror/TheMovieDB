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
    let jsonDependency = MockJsonDependency.movie
    
    override func setUp() {
        configureEnvironment()
        continueAfterFailure = false
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
    
    func configureEnvironment() {
        app.launchEnvironment = ["BASE_URL" : "http://localhost:8080","JSON" : jsonDependency]
        app.launchArguments.append("isUITesting")
        configureMockServer()
    }
    
    func testFlow() {
        app.buttons["Credits"].tap()
        _ = app.alerts.element.waitForExistence(timeout: 5)
        let nameActor = app.staticTexts["Tom Hanks"].label
        XCTAssertEqual(nameActor, "Tom Hanks")
    }

}
