//
//  DetailCollectionViewController.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/4/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DetailCreditsCollectionViewCell"
private let headerIdentifier = "HeaderCellId"

class DetailCollectionViewController: UICollectionViewController {
    var detailMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        //Customization Layout
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumLineSpacing = 4

        
        // header
        collectionView.register(DetailHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier , for: indexPath) as? DetailCreditsCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        configureHeader(header: header)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func configureHeader(header: UICollectionReusableView) {
        let image = detailMovie?.backdrop_path ?? ""
        let imageui = UIImageView()
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(image)")
        imageui.af_setImage(withURL: url!)
        imageui.contentMode = .scaleToFill
        imageui.frame = header.bounds
        header.addSubview(imageui)
    }
}

extension DetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}
