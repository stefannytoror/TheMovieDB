//
//  ListTopRatedTableView.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class TopRatedListView: UICollectionView, ListView {
    var listDelegate: MovieListDelegate?
    let identifier = String(describing: TopRatedListCollectionViewCell.self)
    let itemsPerRow = CGFloat(2)
    let itemSize = CGSize(width: 180, height: 260)
    
    init() {
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        configureCollection()
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollection() {
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}

//MARK: Datasource
extension TopRatedListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDelegate?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier , for: indexPath) as? TopRatedListCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        listDelegate?.configure(cell: cell, index: indexPath.row)
        return cell
    }
    
}

//MARK: DelegateFlowLayout
extension TopRatedListView:  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = collectionView.bounds.width
        let left = ((width - (itemSize.width * itemsPerRow)) / (itemsPerRow + 1))
        let right = ((width - (itemSize.width * itemsPerRow)) / (itemsPerRow + 1))
        return UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
    }
}

