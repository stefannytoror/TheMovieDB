//
//  ListMovieCollectionViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/13/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class ListMovieCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = String(describing: CustomCollectionViewCell.self)
    private let itemsPerRow: CGFloat = 2
    private let  minimunSpaceAmongCells = 5
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifier.self , bundle: nil)

        Request.requestMovie(completionHandler: { (listMovie) in
            
            self.movies = listMovie.results
            // First finish the request then upload tableview with the array
            self.collectionView.reloadData()
        }) { (errorEnum) in
            print(errorEnum)
        }
        // Register cell classes
        self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        setupGridView()
    }

    func setupGridView() {
        let flowLayout =  collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: 154, height: 231)
        let contentSize = flowLayout.collectionViewContentSize
        let width = flowLayout.itemSize.width
        flowLayout.sectionInset.left =  (contentSize.width - (width * itemsPerRow))  / (itemsPerRow + 1)
        flowLayout.sectionInset.right =  (contentSize.width - (width * itemsPerRow)) / (itemsPerRow + 1)
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        // Configure the cell
        let movie = movies[indexPath.row]
        let image = movie.poster_path
        let url = URL(string: "https://image.tmdb.org/t/p/w154\(image)")
        //cell.customTitleCollection.text = movie.titleMovie
        cell.customImageMovie.af_setImage(withURL: url!)
        return cell
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
