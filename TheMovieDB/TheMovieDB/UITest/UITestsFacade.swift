//
//  UITestsFacade.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 7/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

//TODO: Change protocol
//protocol TestApi {
//    static func getData<T: Codable>(type: T.Type) -> T
//}

struct UITestsFacade {
    static var jsonDataDependency: Data? {
        if let json = ProcessInfo.processInfo.environment["JSON"], let data = json.data(using: .utf8) {
            return data
        }
        else {
            return nil
        }
    }
    
    static func extractJsonDependency<T:Codable>(type: T.Type, parsingHandler:  @escaping (T) -> Void, errorHandler: @escaping (RequestError) -> Void) {
        do {
            guard (jsonDataDependency != nil) else {
                print("JSON DATA NIL")
                return
            }
            parsingHandler(try JSONDecoder().decode(T.self, from: jsonDataDependency!))
        }
        catch let error {
            errorHandler(ErrorHandler.response(error: error, statusCode: 0))
            print(error)
        }
    }
}
