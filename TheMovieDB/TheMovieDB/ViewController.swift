//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Foundation
import Alamofire


class ViewController: UIViewController {
    
    /*struct MovieNoCodable {
        let title: String
        let overview: String
        let posterPath: String
        let backdropPath: String
     
    }*/
    
    struct Movie: Codable {
        var titleMovie: String
        var overview: String
        
        enum CodingKeys: String, CodingKey {
            case titleMovie = "title"
            case overview
        }
    }
    
    struct ListMovie: Codable {
        var created_by: String
        var items: [Movie]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        Alamofire.request("https://api.themoviedb.org/3/movie/2?language=en-US&api_key=1f4d7de5836b788bdfd897c3e0d0a24b").responseJSON { response in
            //debugPrint(response)
         
         //Request a movie using codable
            
            //let utf8Text = String(data: data, encoding: .utf8
            if let data = response.data {
                //print("Data: \(utf8Text)") // original server data as UTF8 string
                let decoder = JSONDecoder()
                let movieObject = try? decoder.decode(Movie.self, from: data)
                //print(movieObject?.titleMovie ?? "null")
            }
            
         
         //Extract the parameters of a JSON using a structure no codable
         /*
            guard let json = response.result.value,
             let movie = json as? [String:Any] else {
                    return
            }
           let movieDetail = MovieNoCodable(title: movie["title"] as! String,
                                    overview: movie["overview"] as! String,
                                    posterPath: movie["poster_path"] as! String,
                                    backdropPath: movie["backdrop_path"] as! String
            )
            print(movieDetail)
            print("Title: \(movieDetail.title) \n Overview: \(movieDetail.overview) \n backdropPath: \(movieDetail.backdropPath) \n posterPath: \(movieDetail.posterPath)")
            //print("JSON: \(json)")
        */
        }
        
        
        //Request list of movies using codable
        
        Alamofire.request("https://api.themoviedb.org/3/list/1?language=en-US&api_key=1f4d7de5836b788bdfd897c3e0d0a24b").responseJSON { response in
            //debugPrint(response)
            
            //let utf8Text = String(data: data, encoding: .utf8
            if let data = response.data {
                //print("Data: \(utf8Text)") // original server data as UTF8 string
                let decoder = JSONDecoder()
                let movieObject = try? decoder.decode(ListMovie.self, from: data)
                guard let itemsMovie = movieObject?.items else { return}
                
                for items in itemsMovie {
                    print("\(items.titleMovie)\n")
                }
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}
