//
//  NetworkError.swift
//  Mozart
//
//  Created by dukens on 11/29/22.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse
    case generalError
}
