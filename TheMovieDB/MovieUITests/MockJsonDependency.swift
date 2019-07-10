//
//  MockString.swift
//  MovieUITests
//
//  Created by Stefanny Toro Ramirez on 7/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//
// Mock json for send dependencies to a viewControlller

import Foundation

struct MockJsonDependency {
    static let movie =  """
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
}
