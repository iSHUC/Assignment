//
//  APILoader.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

class APILoader<T: APIHandler> {
    
    // MARK: - Properties
    
    let service: T
    let session: URLSession
    
    // MARK: - Init
    
    init(service: T, session: URLSession = .shared) {
        
        self.service = service
        self.session = session
    }
    
    // MARK: - Methods
    
    func load() async throws -> T.ResponseType {
        
        // Check for invalid request
        guard let request = service.request() else {
            
            throw APIError(code: 123, message: "Invalid Request")
        }
        
        let (data, urlResponse) = try await session.data(for: request)
        
        // Check for invalid http response
        guard let httpResponse = urlResponse as? HTTPURLResponse else {

            throw APIError(code: 0, message: "Invalid http response")
        }
        
        // Parse response
        return try service.response(data, httpResponse: httpResponse)
    }
}

