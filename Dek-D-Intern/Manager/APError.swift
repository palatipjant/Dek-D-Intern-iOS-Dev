//
//  APError.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 21/2/2567 BE.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case authenticationError
}
