//
//  APIService.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

class APIService: Service {
    
    // MARK: - Get Breeds
    
    func getBreeds() async throws -> Breeds {
        
        let service = BreedService()
        
        let loader = APILoader(service: service)
        return try await loader.load()
    }
    
    // MARK: - Get Breed Images
    
    func getBreedImage(_ breed: String) async throws -> BreedImage {
        
        let service = BreedImageService(breed: breed)
        
        let loader = APILoader(service: service)
        return try await loader.load()
    }
}
