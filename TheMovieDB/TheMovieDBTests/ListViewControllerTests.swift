//
//  ListViewControllerTests.swift
//  TheMovieDBTests
//
//  Created by Stefanny Toro Ramirez on 4/2/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest

@testable import TheMovieDB
class ListViewControllerTests: XCTestCase {
    
    var listViewController: ListViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = String(describing: ListViewController.self)
        
        listViewController = storyboard.instantiateViewController(withIdentifier: identifier) as? ListViewController
         _ = listViewController.view
    }

    override func tearDown() {
        listViewController = nil
        super.tearDown()
    }

    func testSubView() {
        XCTAssert(listViewController.listView != nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
