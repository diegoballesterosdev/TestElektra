//
//  ErrorCases.swift
//  TestElektra
//
//  Created by Diego Ballesteros on 08/09/24.
//

import Foundation

enum ErrorCases: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .invalidData:
            return "Invalid data"
        }
    }
}
