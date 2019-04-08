//
//  MovieInterfaceController.swift
//  Watch Extension
//
//  Created by Stefanny Toro Ramirez on 4/5/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit
import WatchKit

class MovieInterfaceController: WKInterfaceController {
    
    var recomendedMovie = Movie()

    //MARK: Properties
    @IBOutlet weak var movieImage: WKInterfaceImage!
    @IBOutlet weak var movieTitle: WKInterfaceLabel!
    @IBOutlet weak var movieVoteAverage: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        recomendedMovie = Facade.randomMovie()
        let image = UIImage(named: "backImage")
        movieImage.setImage(image)
        movieTitle.setText(recomendedMovie.titleMovie)
        movieVoteAverage.setText(String(recomendedMovie.vote_average))
    }
}
