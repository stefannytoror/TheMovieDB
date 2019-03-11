//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//  Created by Stefanny Toro.

import UIKit
import Foundation
import Alamofire


class ViewController: UIViewController {
    
    func printMovie(movie:Movie) {
        print(movie)
    }
    
    //var movie2 = Movie(titleMovie: "ee",overview: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Request.requestMovie(completionHandler: { (movie) in
            print(movie)
        }) { (errorEnum) in
            print(errorEnum)
        }
        
        //completion handler get a struct Movie and returns void
        //request.requestMovie(completionHandler: printMovie)
    }
        
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}
