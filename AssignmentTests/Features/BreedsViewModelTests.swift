//
//  BreedsViewModelTests.swift
//  AssignmentTests
//
//  Created by Ishwar on 09/08/22.
//

import XCTest
@testable import Assignment

class BreedsViewModelTests: XCTestCase {

    func test_getBreeds_withService_shouldReturnBreedsCount96() async throws {
        
        let expected = 96
        
        let service = MockAPIService()
        let viewModel = BreedsViewModel(service: service)
        
        let result = try await viewModel.getBreeds().count
        
        XCTAssertEqual(result, expected, "Was '\(result)' but should have been: '\(expected)'")
    }
}
