//
//  BreedImageService.swift
//  Assignment
//
//  Created by Ishwar on 09/08/22.
//

import Foundation

struct BreedImageService: APIHandler {

    // MARK: - Properties

    let breed: String

    // MARK: - Request

    func request() -> URLRequest? {

        let urlString = APIPath.breedImages.replacingOccurrences(of: "$BREED$", with: breed)
        guard let url = URL(string: urlString) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }

    // MARK: - Response

    func response(_ data: Data, httpResponse: HTTPURLResponse) throws -> BreedImage {

        try parseResponse(data, httpResponse: httpResponse)
    }
}
