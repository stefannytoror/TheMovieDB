//
//  DetailCollectionViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/4/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DetailCellId"
private let headerIdentifier = "HeaderCellId"

class DetailCollectionViewController: UICollectionViewController {
    var detailMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        //Customization Layout
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            let padding = CGFloat(16)
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
        

        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // header
        collectionView.register(DetailHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)

    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .gray
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        let image = detailMovie?.backdrop_path ?? ""
        let imageui = UIImageView()
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        imageui.af_setImage(withURL: url!)
        imageui.frame = header.bounds
        header.addSubview(imageui)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

}

extension DetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 138)
    }
}
