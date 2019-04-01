//
//  ListMovieTableViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class ListMovieTableViewController: UITableViewController {
    
    var movies = [Movie]()
    let identifier = String(describing: CustomMovieTableViewCell.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: identifier, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: identifier)
        
        Request.requestMovie(completionHandler: { (listMovie) in
            
            self.movies = listMovie.results
            // First finish the request then upload tableview with the array
            self.tableView.reloadData()
            
        }) { (errorEnum) in
            print(errorEnum)
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CustomMovieTableViewCell else {
            fatalError("The dequeued cell is not an instance of MovieTableViewCell.")
        }
        let movie = movies[indexPath.row]
        let image = movie.poster_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        
        cell.customImageMovie.af_setImage(withURL: url!)
        return cell
    }
    
}
