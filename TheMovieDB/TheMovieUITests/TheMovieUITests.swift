//
//  TheMovieUITests.swift
//  TheMovieUITests
//
//  Created by Stefanny Toro Ramirez on 4/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest

class TheMovieUITests: XCTestCase {
     var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test() {
        let tabBarsQuery = XCUIApplication().tabBars
        let item = tabBarsQuery.buttons["Top Rated"]
        item.tap()
        if item.isSelected {
            XCTAssertTrue(item.exists)
        }
        else{
            XCTFail()
        }
        tabBarsQuery.buttons["Recents"].tap()
    }
    
    func test2() {
        let app = XCUIApplication()
        app.tables.staticTexts["The Silence"].tap()
    }

}
