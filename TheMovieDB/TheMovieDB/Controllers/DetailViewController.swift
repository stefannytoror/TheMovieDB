//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailMovie: Movie?
    
    //MARK: Properties
    @IBOutlet weak var imageDetailMovie: UIImageView!
    @IBOutlet weak var overviewDetailMovie: UILabel!
    @IBOutlet weak var titleDetailMovie: UILabel!
    @IBOutlet weak var dateDetailMovie: UILabel!
    @IBOutlet weak var countAverageDetailMovie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOutletValue()
    }
    
    func setOutletValue() {
        titleDetailMovie.text = detailMovie?.titleMovie
        dateDetailMovie.text = detailMovie?.release_date
        countAverageDetailMovie.text = "\(detailMovie?.vote_average ?? 0)"
        overviewDetailMovie.text = detailMovie?.overview
        
        guard let image = detailMovie?.poster_path, let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)") else {
            imageDetailMovie.tintColor = UIColor.clear
            return
        }
        imageDetailMovie.af_setImage(withURL: url)
    }
}
