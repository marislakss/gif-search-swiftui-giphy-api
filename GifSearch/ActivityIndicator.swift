//
//  ActivityIndicator.swift
//  GifSearch
//
//  Created by Māris Lakšs on 04/05/2023.
//

import SwiftUI

// MARK: - ActivityIndicator

struct ActivityIndicator: UIViewRepresentable {
    // MARK: - UIViewRepresentable Methods

    func makeUIView(context _: Context) -> UIActivityIndicatorView {
        // Create and configure the UIActivityIndicatorView.
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.startAnimating()
        return indicator
    }

    func updateUIView(_: UIActivityIndicatorView, context _: Context) {
        // No updates needed.
    }
}

// MARK: - Previews

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
