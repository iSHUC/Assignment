//
//  APIError.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

struct APIError: Error {
    
    let code: Int
    let message: String
}
