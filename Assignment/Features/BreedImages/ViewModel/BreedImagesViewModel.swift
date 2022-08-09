//
//  BreedImagesViewModel.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

struct BreedImagesViewModel {
    
    // MARK: - Properties
    
    private let service: Service
    var breed: String?
    
    // MARK: - Init

    init(service: Service) {

        self.service = service
    }
    
    // MARK: - Methods
    
    func getBreedImageURL(_ breed: String) async throws -> URL? {
        
        let breedImage = try await service.getBreedImage(breed)
        return URL(string: breedImage.message)
    }
}
