//
//  TopRatedTableViewCell.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 4/8/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class TopRatedTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
