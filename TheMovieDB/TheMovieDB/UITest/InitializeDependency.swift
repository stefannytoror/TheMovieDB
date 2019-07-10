//
//  TestViewControlller.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 7/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit



struct InitializeDependency {

    
    static func makeDetailViewController() -> UIViewController {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        UITestsFacade.extractJsonDependency(type: Movie.self, parsingHandler: { (movie) in
            initialViewController?.movieDetail = movie
        }) { (error) in
            print(error)
        }
        return initialViewController!
    }
    
    
    static func makeCreditsCollectionViewController() -> UIViewController {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "CreditsCollectionViewController") as? CreditsCollectionViewController
        
        UITestsFacade.extractJsonDependency(type: Movie.self, parsingHandler: { (movie) in
            initialViewController?.movieDetail = movie
        }) { (error) in
            print(error)
        }
        return initialViewController!
    }

}
