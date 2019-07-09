//
//  EnvironmentUtilites.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 7/9/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

extension ProcessInfo {
    
    // Used to recognized that UITestings are running and modify the app behavior accordingly    
    var isUITesting: Bool {
        return arguments.contains("isUITesting")
    }
}
