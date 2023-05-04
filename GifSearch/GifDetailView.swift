//
//  GifDetailView.swift
//  GifSearch
//
//  Created by Māris Lakšs on 04/05/2023.
//

import SDWebImageSwiftUI
import SwiftUI

// MARK: - GifDetailView

struct GifDetailView: View {
    let gif: Gif

    // MARK: - Body

    var body: some View {
        VStack {
            // Display the GIF image.
            WebImage(url: URL(string: gif.images.fixedWidthSmall.url))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()

            // Display the GIF title.
            Text(gif.title)
                .font(.title)
                .padding()

            Spacer()
        }
        .navigationBarTitle("Gif Detail", displayMode: .inline)
    }
}

// MARK: - Previews

struct GifDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GifDetailView(gif: Gif(
            id: "1",
            title: "Example",
            images: GifImages(fixedWidthSmall: GifImage(
                url: "https://media0.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy-preview.gif?cid=ecf05e47bm32nql3ng25anq3ec16rmwy1bdi0jj1nf5b5hr5&rid=giphy-preview.gif&ct=g",
                width: "100",
                height: "100"
            ))
        ))
    }
}
