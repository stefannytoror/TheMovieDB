//
//  TheMoviedbService.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import Alamofire

enum MoviesListType  {
    case nowPlaying
    case topRated
    case popular
    case upcomming
    case credits(id: Int)
    case similar(id: Int)
}

extension MoviesListType {
    var path : String {
        switch self {
        case .nowPlaying: return "/movie/now_playing"
        case .topRated: return "/movie/top_rated"
        case .popular: return "/movie/popular"
        case .upcomming: return "/movie/upcoming"
        case .credits(let id): return("/movie/\(id)/credits")
        case .similar(let id): return("/movie/\(id)/similar")
        }
    }
}


struct TheMovieDBService {
    static var host: String {
        if let host = ProcessInfo.processInfo.environment["BASE_URL"] {
            return host
        }
        else {
            return "https://api.themoviedb.org/3"
        }
    }
    static let imgBaseURL =  "https://image.tmdb.org/t/p/w500"
    static let apiKey = "1f4d7de5836b788bdfd897c3e0d0a24b"
}
