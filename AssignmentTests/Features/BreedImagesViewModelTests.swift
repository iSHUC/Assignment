//
//  BreedImagesViewModelTests.swift
//  AssignmentTests
//
//  Created by Ishwar on 09/08/22.
//

import XCTest
@testable import Assignment

class BreedImagesViewModelTests: XCTestCase {
    
    func test_getBreedImageURL_withServiceAndBreed_shouldReturnBreedImageURLNotNil() async throws {
        
        let service = MockAPIService()
        let viewModel = BreedImagesViewModel(service: service)
        
        let result = try await viewModel.getBreedImageURL("mastiff-bull")
        
        XCTAssertNotNil(result, "Was '\(String(describing: result))' but should have been: 'Not Nil'")
    }
}
