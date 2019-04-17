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
    
    var tableView = ViewListTable()
    var listDelegate: MovieListDelegate?
    var cell: CustomMovieTableViewCell!
    let identifierCell = String(describing: CustomMovieTableViewCell.self)
    
    var movieListDelegate = ListViewController()
    
    override func setUp() {
        movieListDelegate.movies = [Movie()]
        tableView.listDelegate = movieListDelegate
    }

    override func tearDown() {
        listDelegate = nil
        super.tearDown()
    }

    
    
    func testListView() {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell) as? CustomMovieTableViewCell
        tableView.listDelegate?.configure(cell: cell!, index: 0)
        
        let movieSize = tableView.listDelegate?.numberOfItems()
        let titleMovieCell = cell?.customTitleMovie?.text
        
        XCTAssertEqual(movieSize,movieListDelegate.movies.count)
        XCTAssertEqual(titleMovieCell, "")
    }
}

//class MockListViewController: MovieListDelegate {
//    var movies = [Movie]()
//    
//    func numberOfItems() -> Int {
//        return movies.count
//    }
//    
//    func configure(cell: Cell, index: Int) {
//        cell.customTitleMovie?.text = movies[0].titleMovie
//        cell.popularity?.text = ""
//    }
//    
//    func didSelectItemAt(index: Int) {
//        print("selected \(index)")
//    }
//    
//    func setAccessibilityLabel(cell: Cell, index: Int) -> String {
//        return "identifier"
//    }
//    
//    
//}
