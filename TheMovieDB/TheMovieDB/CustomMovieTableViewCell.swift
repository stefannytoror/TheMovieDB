//
//  CustomMovieTableViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/12/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class CustomMovieTableViewCell: UITableViewCell, Cell {
       
    //MAKE: Properties
    @IBOutlet weak var customImageMovie: UIImageView!
    @IBOutlet weak var customTitleMovie: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        customImageMovie.image = nil
    }
}
