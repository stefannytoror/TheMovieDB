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
        
        //prepare for reuse

        
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
        //let cellIdentifier = "CustomMovieTableViewCell"
        //let cellIdentifier = "MovieTableViewCell"
        
        
        // -- study--
                
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CustomMovieTableViewCell else {
            fatalError("The dequeued cell is not an instance of MovieTableViewCell.")
        }
        
        
        let movie = movies[indexPath.row]
        let image = movie.poster_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        //cell.customTitleMovie.text = movie.titleMovie
        cell.customImageMovie.af_setImage(withURL: url!)
        /*Request.requestImage(movie: movie) { (data) in
            guard let image = UIImage(data: data) else {
                return
            }
            cell.customImageMovie.image = image
        }*/
        //cell.titleMovie.text = movie.titleMovie
        

        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
