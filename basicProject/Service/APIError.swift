//
//  APIError.swift
//  haykoop
//
//  Created by MUHCAT on 14.09.2018.
//  Copyright © 2018 catsbilisim. All rights reserved.
//
import Foundation

enum APIError: Error {
    
    case invalidURL
    case responseUnsuccessful
    case missingParameters
}

