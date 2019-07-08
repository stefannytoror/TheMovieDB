//
//  PageControlCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 6/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class PageControlCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var imageRecomendedMovie: UIImageView!
    @IBOutlet weak var descriptionMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
