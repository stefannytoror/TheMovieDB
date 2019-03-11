//
//  MovieTableViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK: Properties
    //@IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
