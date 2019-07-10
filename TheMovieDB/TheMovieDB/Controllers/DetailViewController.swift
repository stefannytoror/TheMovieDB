//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

private let reuseIdentifier = String(describing: SimilarCollectionViewCell.self)

class DetailViewController: UIViewController {
    var movieDetail: Movie?
    var similarMovies = [Movie]()
    var movieId: Int = 0
    
    //MARK: Properties
    @IBOutlet weak var imageDetailMovie: UIImageView!
    @IBOutlet weak var overviewDetailMovie: UILabel!
    @IBOutlet weak var titleDetailMovie: UILabel!
    @IBOutlet weak var dateDetailMovie: UILabel!
    @IBOutlet weak var imageBackdropMovie: UIImageView!
    
    @IBOutlet weak var similarCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibility()
        setOutletValue()
        requestSimilar()
        configureCollection()
        tapGestureRecognizer()
    }
    
    @objc func dismissDetail() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setAccessibility() {
        titleDetailMovie.accessibilityIdentifier = AccessibilityHelper.TitleDetailMovie.rawValue
        overviewDetailMovie.accessibilityIdentifier = AccessibilityHelper.OverviewDetailMovie.rawValue
        dateDetailMovie.accessibilityIdentifier = AccessibilityHelper.DateDetailMovie.rawValue
    }
    
    func requestSimilar() {
        movieId = movieDetail?.id ?? 0
        let selectedListType : MoviesListType = .similar(id: movieId)
        RequestFacade.retrieveMovieList(type: selectedListType, object: ListMovie.self, movieHandler: { (movieList) in
            self.similarMovies = movieList.results
            self.similarCollectionView.reloadData()
        }) { (RequestError) in
            print(RequestError)
        }
    }
    
    func configureCollection() {
        //collection view
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        similarCollectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        similarCollectionView.dataSource = self
        similarCollectionView.delegate = self
    }
    
    func tapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDetail))
        view.addGestureRecognizer(tapGesture)
    }
    
    func setOutletValue() {
        titleDetailMovie.text = movieDetail?.titleMovie
        dateDetailMovie.text = movieDetail?.release_date
        overviewDetailMovie.text = movieDetail?.overview
        
        guard let image = movieDetail?.poster_path,  let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)") else {
            imageDetailMovie.tintColor = UIColor.clear
            return
        }
        guard let backImage = movieDetail?.backdrop_path, let url2 = URL(string: "https://image.tmdb.org/t/p/w500\(backImage)") else {
            imageBackdropMovie.tintColor = UIColor.clear
            return
        }
        imageDetailMovie.af_setImage(withURL: url)
        imageBackdropMovie.af_setImage(withURL: url2)
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "creditsSegue") {
            // Create a new variable to store the instance of PlayerTableViewController
            let detailVC = segue.destination as! CreditsCollectionViewController
            detailVC.movieDetail = movieDetail
        }
    }
    
    @IBAction func launchCreditsMovie(_ sender: Any) {
        performSegue(withIdentifier: "creditsSegue", sender: nil)
    }
    
}

//MARK: UICollectionView
extension DetailViewController: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SimilarCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        
        let similarMovie = similarMovies[indexPath.item]
        let image = similarMovie.poster_path
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        cell.posterImage.af_setImage(withURL: url!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 98, height: 138)
    }
    
}
