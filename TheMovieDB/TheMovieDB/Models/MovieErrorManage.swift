//
//  MovieErrorManage.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/27/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

enum ErrorEnum: Error {
    case errorDecoder(String)
    case errorDataNotFound
    case errorConectionFaile(Error)
    case otherError
}

extension ErrorEnum: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .errorDecoder(_):
            return NSLocalizedString("DecodingError", comment: "")
        case .errorDataNotFound:
            return NSLocalizedString("Description", comment: "")
        case .otherError:
            return NSLocalizedString("Other error", comment: "")
        case .errorConectionFaile(_):
            return NSLocalizedString("Error conection faile", comment: "")
        }
    }
}
