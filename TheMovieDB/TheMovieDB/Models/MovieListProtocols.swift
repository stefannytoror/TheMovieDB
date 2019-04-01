//
//  MovieList.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol MovieListDelegate: class {
    func numberOfItems() -> Int
    func configure(cell: Cell, index: Int)
    func didSelectItemAt(index: Int)
}

protocol ListView {
    var listDelegate: MovieListDelegate? {get set}
    func reloadData()
}

protocol Cell {
    var customImageMovie: UIImageView! {get}
    var customTitleMovie: UILabel? {get}
    var customVoteAverageMovie: UILabel? {get}
}
