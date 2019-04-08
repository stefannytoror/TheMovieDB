//
//  ListTopRatedTableView.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class ListTopRatedTableView: UITableView, ListView {
    var listDelegate: MovieListDelegate?
    let identifier = String(describing: TopRatedTableViewCell.self)

}
