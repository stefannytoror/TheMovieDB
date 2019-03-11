//
//  MovieDetails.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/1/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

struct SpokenLanguage: Codable {
    var name: String
    
    func showLanguage() -> String {
        return "name: \(name)\n"
    }
}

struct ProductionCountries: Codable {
    
    var name: String
    
    func showProductionCountries() -> String {
        return "name: \(name)\n"
    }
}

struct AllInfoMovie: Codable {
    
    var title: String
    var overview: String
    var spoken_languages: [SpokenLanguage]
    var production_countries: [ProductionCountries]
    
    func showAllDetails() {
        print("Title: \(title)\n Overview: \(overview)\n Spoken Language: \n")
        
        for language in spoken_languages {
           print(language.showLanguage())
        }
        print("Production countries:")
        for countrie in production_countries {
            print(countrie.showProductionCountries())
        }
    }
}




