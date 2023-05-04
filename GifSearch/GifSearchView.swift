//
//  GifSearchView.swift
//  GifSearch
//
//  Created by Māris Lakšs on 04/05/2023.
//

import Combine
import SDWebImageSwiftUI
import SwiftUI

// The main view for displaying and searching GIFs.
struct GifSearchView: View {
    @ObservedObject private var viewModel: GifSearchViewModel
    @State private var searchText = ""
    private var cancellables = Set<AnyCancellable>()

    // Initialize the view with a view model.
    init(viewModel: GifSearchViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Search Bar

                HStack {
                    TextField("Search gifs...", text: $searchText)
                        .padding(.leading, 16)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)

                    // Display the activity indicator when loading GIFs.
                    if viewModel.isLoading {
                        ActivityIndicator()
                    }
                }
                .padding()

                // MARK: - Gif Grid

                ScrollView {
                    LazyVStack(spacing: 16) {
                        // Iterate through the list of GIFs and display each one using GifItemView.
                        ForEach(viewModel.gifs.indices, id: \.self) { index in
                            GifItemView(gif: viewModel.gifs[index])
                                .onAppear {
                                    // Load more GIFs when the last GIF appears.
                                    if index == viewModel.gifs.count - 1 {
                                        viewModel.loadMoreGifs()
                                    }
                                }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Gif Search", displayMode: .inline)
        }
        .onChange(of: searchText) { newValue in
            // Update the search text in the view model when it changes.
            viewModel.searchText = newValue
        }
    }
}
