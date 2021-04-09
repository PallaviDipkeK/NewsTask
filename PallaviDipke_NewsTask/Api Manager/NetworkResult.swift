//
//  NetworkResult.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/7/21.
//

import Foundation

enum HTTPStatusCodes: Int {
    case success = 200
    case notFound = 404
    case tooManyRequests = 429
    case unAvailable = 503
}
