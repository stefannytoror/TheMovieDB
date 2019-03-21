//
//  ListCollectionView.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

class ViewListCollection: UICollectionView, ListView {
    
    var listDelegate: MovieListDelegate?
    let identifier = String(describing: CustomCollectionViewCell.self)
    let itemsPerRow = CGFloat(4)
    let sizeItem = CGSize(width: 200, height: 300)
    
    init() {
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: identifier)
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewListCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDelegate?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier , for: indexPath) as? CustomCollectionViewCell else {
            fatalError("The dequeued cell is not an instance ")
        }
        listDelegate?.configure(cell: cell, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeItem
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = collectionView.bounds.width
        let left = ((width - (sizeItem.width * itemsPerRow)) / (itemsPerRow + 1))
        let right = ((width - (sizeItem.width * itemsPerRow)) / (itemsPerRow + 1))
        return UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
    }
}
