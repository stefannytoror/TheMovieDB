//
//  RequestFacadeTests.swift
//  TheMovieDBTests
//
//  Created by Stefanny Toro Ramirez on 4/2/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
import OHHTTPStubs

@testable import TheMovieDB

class RequestFacadeTests: XCTestCase {
    var testMovie = [Movie]()
    var error = ErrorEnum.errorConectionFaile.errorDescription
    var mockMovieJson: [String: Any]?
    var mockListMovie = ListMovie()
    var mockMovie = Movie()
    
    override func setUp() {
        super.setUp()
        mockMovieJson = [
            "page": 1,
            "results": [
                ["backdrop_path": "/pZ78ksjPlXf3q2EeONN8WdHE03Y.jpg",
                 "id": 500682,
                 "overview": "In 1934",
                 "release_date": "2019-03-15",
                 "title": "The Highwaymen",
                 "vote_average": 7.2,
                 "vote_count": 101,
                 "popularity": 20.394
                ],
                [
                    "backdrop_path": "/pZ78ksjPlXf3q2EeONN8WdHE03Y.jpg",
                    "id": 500682,
                    "overview": "In 1934",
                    "release_date": "2019-03-15",
                    "title": "The Highwaymen",
                    "vote_average": 7.2,
                    "vote_count": 101,
                    "popularity": 20.394
                ]
            ]
        ]
        mockMovie.backdrop_path =  "/pZ78ksjPlXf3q2EeONN8WdHE03Y.jpg"
        mockMovie.id = 500682
        mockMovie.overview = "In 1934"
        mockMovie.titleMovie = "The Highwaymen"
        mockMovie.popularity = 20.394
        mockMovie.vote_count = 101
        mockMovie.vote_average = 7.2
        mockListMovie.page = 1
        mockListMovie.results = [mockMovie]
        
    }
    override func tearDown() {
        super.tearDown()
        OHHTTPStubs.removeAllStubs()
    }
    
    func testFetchError(){
        var error2: String = ""
        RequestFacade.url = ""
        let expectation = self.expectation(description: "MakingRequest")
        
        RequestFacade.trending(movieHandler: { (listMovie) in
            XCTFail("Must return an error")
        }) { (errorEnum) in
            error2 = errorEnum.errorDescription ?? ""
            expectation.fulfill()
        }
        //waitForExpectations(timeout: 5, handler: nil)
        wait(for: [expectation], timeout: 3)
        XCTAssert(error2 == error)
    }
    
    func testFetchSucces(){
        RequestFacade.url = "https://api.themoviedb.org/3/trending/movie/day?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
        stub(condition: isHost("api.themoviedb.org")) { _ in
            return OHHTTPStubsResponse(jsonObject: self.mockMovieJson!,
                                       statusCode: 200,
                                       headers: nil)
        }
        let waiting = self.expectation(description: "MakingRequestMovieTrending")
        
        RequestFacade.trending(movieHandler: { (listMovie) in
            XCTAssertEqual(self.mockListMovie.page,listMovie.page, "Fetch data movie")
            
        }) { (errorEnum) in
            print(errorEnum)
            waiting.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
}
