//
//  GifItemView.swift
//  GifSearch
//
//  Created by Māris Lakšs on 04/05/2023.
//

import SDWebImageSwiftUI
import SwiftUI

// MARK: - GifItemView

// A view that displays a single gif item, including the gif image and title.
struct GifItemView: View {
    let gif: Gif

    var body: some View {
        // NavigationLink is used to navigate to the GifDetailView when the gif item is tapped.
        NavigationLink(destination: GifDetailView(gif: gif)) {
            VStack {
                // Display the gif image using SDWebImageSwiftUI's WebImage view.
                WebImage(url: URL(string: gif.images.fixedWidthSmall.url))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                // Display the gif title below the image.
                Text(gif.title)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
    }
}

// Sample data for GifItemView_Previews.
let sampleGif = Gif(
    id: "sample",
    title: "Sample Gif",
    images: GifImages(fixedWidthSmall: GifImage(
        url: "https://media.giphy.com/media/j5P0DQIOf4PonLi55G/giphy.gif?cid=ecf05e475w7x8f7xjxnglvi735f3q30ndkm9obpundrvzgva&ep=v1_gifs_search&rid=giphy.gif&ct=g",
        width: "150",
        height: "150"
    ))
)

// MARK: - GifItemView_Previews

// Preview provider for GifItemView.
struct GifItemView_Previews: PreviewProvider {
    static var previews: some View {
        GifItemView(gif: sampleGif)
    }
}
