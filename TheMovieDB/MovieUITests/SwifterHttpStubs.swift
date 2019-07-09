//
//  SwifterHttpStubs.swift
//  TheMovieUITests
//
//  Created by Stefanny Toro Ramirez on 7/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import Swifter

enum HTTPMethod {
    case POST
    case GET
}

class SwifterHttpStubs {
    
    var server = HttpServer()
    
    
    func tearDown() {
        server.stop()
    }
    
    
    func setupStub(url: String, filename: String, method: HTTPMethod = .GET) {
        let testBundle = Bundle(for: type(of: self))
//        let bundle = Bundle(for: type(of: self))
//        print(bundle)
        
        
        let filePath = testBundle.path(forResource: filename, ofType: "json")
        let fileUrl = URL(fileURLWithPath: filePath!)
        let data = try! Data(contentsOf: fileUrl, options: .uncached)
        // Looking for a file and converting it to JSON
        let json = dataToJSON(data: data)
        
        // Swifter response
        let response: ((HttpRequest) -> HttpResponse) = { _ in
            return HttpResponse.ok(.json(json as AnyObject))
        }
        
        
        switch method  {
        case .GET : server.GET[url] = response
        case .POST: server.POST[url] = response
        }
        //try! server.start()
    }
    func startServer(){
        try! server.start()
    }
    
    func dataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
}

