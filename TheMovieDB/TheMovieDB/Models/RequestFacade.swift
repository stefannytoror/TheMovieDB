//
//  Request.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/4/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import Alamofire



// Capture use and then dealloc
class RequestFacade {
    public static var url = "https://api.themoviedb.org/3/trending/movie/day?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    
    // Completionhandler will be a function with a movie as a parameter and his return is void
    static func Trending(movieHandler: @escaping (ListMovie) -> Void ,errorHandler: @escaping (ErrorEnum) -> Void) {
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
                    movieHandler(try JSONDecoder().decode(ListMovie.self, from: data))
                } catch let e as DecodingError {
                    errorHandler(ErrorEnum.errorDecoder(e.localizedDescription))
                    print(String(format: NSLocalizedString("DecodingError", comment: ""), e.localizedDescription))
                } catch {
                    errorHandler(ErrorEnum.otherError)
                }
                
            case .failure(let error):
                print(error)
                errorHandler(ErrorEnum.errorConectionFaile)
            }
        }
    }
    
    static func Similar(movieId: Int, movieHandler: @escaping (ListMovie) -> Void ,errorHandler: @escaping (ErrorEnum) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/movie/\(movieId)/similar?page=1&language=en-US&api_key=1f4d7de5836b788bdfd897c3e0d0a24b").responseJSON { response in
            switch response.result {
                
            case .success:
                print("Validation Successful")
                guard let data = response.data else {
                    errorHandler(ErrorEnum.errorDataNotFound)
                    return
                }
                do {
                    // Call the method and can escape
                    movieHandler(try JSONDecoder().decode(ListMovie.self, from: data))
                    
                } catch let e as DecodingError {
                    errorHandler(ErrorEnum.errorDecoder(e.localizedDescription))
                    print(String(format: NSLocalizedString("DecodingError", comment: ""), e.localizedDescription))
                } catch {
                    errorHandler(ErrorEnum.otherError)
                }
                
            case .failure(let error):
                print(error)
                errorHandler(ErrorEnum.errorConectionFaile)
            }
        }
    }
    
    
    static func upComing(movieHandler: @escaping (ListMovie) -> Void ,errorHandler: @escaping (ErrorEnum) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/movie/upcoming?page=1&language=en-US&api_key=1f4d7de5836b788bdfd897c3e0d0a24b").responseJSON { response in
            switch response.result {
                
            case .success:
                print("Validation Successful")
                guard let data = response.data else {
                    errorHandler(ErrorEnum.errorDataNotFound)
                    return
                }
                do {
                    // Call the method and can escape
                    movieHandler(try JSONDecoder().decode(ListMovie.self, from: data))
                    
                } catch let e as DecodingError {
                    errorHandler(ErrorEnum.errorDecoder(e.localizedDescription))
                    print(String(format: NSLocalizedString("DecodingError", comment: ""), e.localizedDescription))
                } catch {
                    errorHandler(ErrorEnum.otherError)
                }
                
            case .failure(let error):
                print(error)
                errorHandler(ErrorEnum.errorConectionFaile)
            }
        }
    }
    
    static func requestImage(movie: Movie , completionHandler: @escaping (Data) -> Void ) {
        let image = movie.poster_path
        Alamofire.request("https://image.tmdb.org/t/p/w500\(image)").responseData { response in
            switch response.result {
            case .success:
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