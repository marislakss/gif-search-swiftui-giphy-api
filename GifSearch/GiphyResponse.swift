//
//  GiphyResponse.swift
//  GifSearch
//
//  Created by Māris Lakšs on 04/05/2023.
//

import Foundation

// MARK: - GiphyResponse

struct GiphyResponse: Codable {
    let data: [Gif]
}

// MARK: - Gif

struct Gif: Codable {
    let id: String
    let title: String
    let images: GifImages
}

// MARK: - GifImages

struct GifImages: Codable {
    let fixedWidthSmall: GifImage

    enum CodingKeys: String, CodingKey {
        case fixedWidthSmall = "fixed_width_small"
    }
}

// MARK: - GifImage

struct GifImage: Codable {
    let url: String
    let width: String
    let height: String
}
