//
//  BreedService.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

struct BreedService: APIHandler {

    // MARK: - Request
    
    func request() -> URLRequest? {

        guard let url = URL(string: APIPath.breeds) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }

    // MARK: - Response
    
    func response(_ data: Data, httpResponse: HTTPURLResponse) throws -> Breeds {

        try parseResponse(data, httpResponse: httpResponse)
    }
}
