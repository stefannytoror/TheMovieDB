//
//  MovieStruct.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/27/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var id: Int
    var titleMovie: String
    var overview: String
    var poster_path: String
    var backdrop_path: String
    var release_date: String
    var popularity: Float
    var vote_average: Float
    var vote_count: Int
    //spoken_languages
    
    enum CodingKeys: String, CodingKey {
        case id
        case titleMovie = "title"
        case overview
        case poster_path
        case backdrop_path
        case release_date
        case popularity
        case vote_average
        case vote_count
    }
}

struct ListMovie: Codable {
    var page: Int
    var results: [Movie]
}
