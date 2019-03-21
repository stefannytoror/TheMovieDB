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
    
    var movies = [Movie]()
    var listView: ListView?
   
    override func viewWillAppear(_ animated: Bool) {
        (listView as? UIView)?.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            listView = ViewListCollection()
        }
        else {
            listView = ViewListTable()
        }     
        Request.requestMovie(completionHandler: { (listMovie) in
            self.movies = listMovie.results
            self.listView?.reloadData()
        }) { (errorEnum) in
            print(errorEnum)
        }
        view.addSubview(listView as! UIView)
        listView?.listDelegate = self
    }
}

extension ViewController: MovieListDelegate {
    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func configure(cell: Cell, index: Int) {
        let movie = movies[index]
        let image = movie.poster_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        cell.customImageMovie.af_setImage(withURL: url!)
        
        if (cell.customTitleMovie != nil) {
            cell.customTitleMovie?.text = movie.titleMovie
        }
    }
   
    func didSelectItemAt(item: Int) {
        print(item)
    }
}
