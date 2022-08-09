//
//  BreedsViewModel.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

struct BreedsViewModel {

    // MARK: - Properties

    private let service: Service
    var title: String { "Breeds" }

    // MARK: - Init

    init(service: Service) {

        self.service = service
    }

    // MARK: - Methods

    func getBreeds() async throws -> [String] {
        
        let breeds = try await service.getBreeds()
        return breeds.message.map { $0.key }
    }
}
