//
//  ContentView.swift
//  GifSearch
//
//  Created by Māris Lakšs on 04/05/2023.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    var body: some View {
        // Create an instance of the APIClient and GifSearchViewModel.
        let apiClient = APIClient()
        let viewModel = GifSearchViewModel(apiClient: apiClient)

        // Display the GifSearchView with the provided view model.
        GifSearchView(viewModel: viewModel)
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
