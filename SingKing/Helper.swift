//
//  Helper.swift
//  SingKing
//
//  Created by RS on 27.09.22.
//

import Foundation

struct Constants {
    static let charactersURL = URL(string: "https://breakingbadapi.com/api/characters")
}

enum APIError: Error {
    case invalidURL
    case noData
    case invalidData
}
