//
//  APIPath.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

enum APIPath {
    
    // MARK: - Base URL
    
    private static let baseURL = "https://dog.ceo/api/"
    
    // MARK: - Endpoints
    
    static var breeds: String { baseURL + "breeds/list/all" }
    
    static var breedImages: String { baseURL + "breed/$BREED$/images/random" }
}
