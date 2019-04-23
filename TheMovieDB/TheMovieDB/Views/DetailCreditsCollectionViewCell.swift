//
//  DetailCreditsCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/23/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class DetailCreditsCollectionViewCell: UICollectionViewCell {
    
    //MASK: Properties
    @IBOutlet weak var actorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        actorImage.layer.borderWidth = 1
        actorImage.layer.masksToBounds = false
        actorImage.layer.borderColor = UIColor.black.cgColor
        actorImage.layer.cornerRadius = actorImage.frame.height/2
        actorImage.clipsToBounds = true
    }

}
