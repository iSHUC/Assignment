//
//  APIHandler.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

enum HTTPMethod: String {
    
    case get = "GET"
}

typealias APIHandler = RequestHandler & ResponseHandler
