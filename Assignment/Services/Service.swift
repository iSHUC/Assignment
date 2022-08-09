//
//  Service.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

protocol Service {
    
    func getBreeds() async throws -> Breeds
    func getBreedImage(_ breed: String) async throws -> BreedImage
}
