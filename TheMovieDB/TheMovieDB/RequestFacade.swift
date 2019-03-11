//
//  Request.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/4/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import Alamofire

struct Movie: Codable {
    var titleMovie: String
    var overview: String
    var poster_path: String
    
    
    enum CodingKeys: String, CodingKey {
        case titleMovie = "title"
        case overview
        case poster_path
    }
}

struct ListMovie: Codable {
    //var created_by: String
    var page: Int
    var results: [Movie]
}

enum ErrorEnum {
    case errorDecoder(String)
    case errorDataNotFound
    case errorConectionFaile(Error)
    case otherError
}


/*
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}*/


// capture use and then dealloc
class Request {
    static let url = "https://api.themoviedb.org/3/trending/movie/day?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    
    /*lazy var showUrlRequest: () -> Void = {
        //[ unowned self ] in
        print(self.url)
    }*/
    
   
    
    // Completionhandler will be a function with a movie as a parameter and his return is void
    
    static func requestMovie(completionHandler: @escaping (ListMovie) -> Void ,errorHandler: @escaping (ErrorEnum) -> Void) {
        
        Alamofire.request(url).responseJSON { response in
            
            switch response.result {
                
            case .success:
                
                print("Validation Successful")
                
                guard let data = response.data else {
                    errorHandler(ErrorEnum.errorDataNotFound)
                    return
                }
                
                do {
                    // Call the method and can escape
                    completionHandler(try JSONDecoder().decode(ListMovie.self, from: data))
                    
                } catch let e as DecodingError {
                    errorHandler(ErrorEnum.errorDecoder(e.localizedDescription))
                    print("Decoding error: \(e.localizedDescription)")
                    
                } catch {
                    errorHandler(ErrorEnum.otherError)
                }
                
            case .failure(let error):
                errorHandler(ErrorEnum.errorConectionFaile(error))
            }
        }
    }
    
     static func requestImage(movie: Movie , completionHandler: @escaping (Data) -> Void ) {
        
       
            let image = movie.poster_path
            Alamofire.request("https://image.tmdb.org/t/p/w500\(image)").responseData { response in
                switch response.result {
                case .success:
                    //print("Validation Successful")
                    
                    guard let data = response.data else {
                        print(ErrorEnum.errorDataNotFound)
                        return
                    }
                   completionHandler(data)
                    
                    
                case .failure(let error):
                    print(error)
                }
                
            }
    }
    
}
