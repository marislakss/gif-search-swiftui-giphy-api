//
//  APIClient.swift
//  GifSearch
//
//  Created by Māris Lakšs on 04/05/2023.
//

import Combine
import Foundation

// MARK: - APIClient

class APIClient {
    private let apiKey = "EI6YCDGHfkOiy2OOtam2nq6fHDjxK7Lm"
    private let baseURL = "https://api.giphy.com/v1/gifs"

    /// Searches for gifs using the Giphy API.
    ///
    /// - Parameters:
    ///   - query: The search query.
    ///   - offset: The offset of the results.
    ///   - limit: The maximum number of results to return (default is 25).
    /// - Returns: A publisher that emits an array of Gif objects or an error.
    func searchGifs(query: String, offset: Int, limit: Int = 25) -> AnyPublisher<[Gif], Error> {
        let url =
            URL(
                string: "\(baseURL)/search?api_key=\(apiKey)&q=\(query)&offset=\(offset)&limit=\(limit)"
            )!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: GiphyResponse.self, decoder: JSONDecoder())
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
