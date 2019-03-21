//
//  CustomCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/13/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell, Cell {
    
    var customTitleMovie: UILabel?
    @IBOutlet weak var customImageMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //customTitleCollection.text = ""
        customImageMovie.image = nil
    }
}
