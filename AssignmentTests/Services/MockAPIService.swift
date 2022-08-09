//
//  MockAPIService.swift
//  AssignmentTests
//
//  Created by Ishwar on 09/08/22.
//

import Foundation
@testable import Assignment

class MockAPIService: Service {
    
    // MARK: - Get Breeds
    
    func getBreeds() async throws -> Breeds {
        
        guard
            let path = Bundle(for: type(of: self)).path(forResource: "breeds", ofType: "json"),
            let jsonString = try? String(contentsOfFile: path, encoding: .utf8),
            let jsonData = jsonString.data(using: .utf8)
        else {
            throw APIError(code: 123, message: "Invalid JSON")
        }
        
        return try JSONDecoder().decode(Breeds.self, from: jsonData)
    }
    
    // MARK: - Get Breed Images
    
    func getBreedImage(_ breed: String) async throws -> BreedImage {
        
        guard
            let path = Bundle(for: type(of: self)).path(forResource: "breedImage", ofType: "json"),
            let jsonString = try? String(contentsOfFile: path, encoding: .utf8),
            let jsonData = jsonString.data(using: .utf8)
        else {
            throw APIError(code: 123, message: "Invalid JSON")
        }
        
        return try JSONDecoder().decode(BreedImage.self, from: jsonData)
    }
}

