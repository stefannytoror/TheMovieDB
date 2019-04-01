//
//  ListViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//  Created by Stefanny Toro.

import UIKit
import Foundation
import Alamofire

class ListViewController: UIViewController {
    
    var movies = [Movie]()
    var selectedMoviee: Movie?
    var listView: ListView?
   
    override func viewWillAppear(_ animated: Bool) {
        (listView as? UIView)?.frame = self.view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Trending"
        checkDevice()
        Request.requestMovie(completionHandler: { (listMovie) in
            self.movies = listMovie.results
            self.listView?.reloadData()
        }) { (errorEnum) in
            print(errorEnum.errorDescription as Any)
        }
        view.addSubview(listView as! UIView)
        listView?.listDelegate = self
    }
    
    func checkDevice() {
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            listView = ViewListCollection()
        }
        else {
            listView = ViewListTable()
        }
    }
}

//MARK: MovieListDelegate
extension ListViewController: MovieListDelegate {
    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func configure(cell: Cell, index: Int) {
        let movie = movies[index]
        let image = movie.backdrop_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        cell.customImageMovie.af_setImage(withURL: url!)
        
        if (cell.customTitleMovie != nil && cell.customVoteAverageMovie != nil) {
            cell.customTitleMovie?.text = movie.titleMovie
            cell.customVoteAverageMovie?.text = String(movie.vote_average)
        }
    }
   
    func didSelectItemAt(index: Int) {
        let selectedMovie = movies[index]
        selectedMoviee = movies[index]
        sendDataMovie()
        //performSegue(withIdentifier: "showDetailMovie", sender: selectedMovie)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailMovie" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.detailMovie = sender as? Movie
        }
    }
     let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
     detailViewController.movie = movies[atIndexPath.item]
     self.navigationController!.pushViewController(detailViewController, animated: true)

     
     */
    
    func sendDataMovie(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailController = storyboard.instantiateViewController(withIdentifier:"DetailViewController") as? DetailViewController
        detailController?.detailMovie = self.selectedMoviee
        self.present(detailController! , animated: true, completion: nil)
        
    }
}
