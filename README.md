# GifSearch

GifSearch App is a simple SwiftUI application that allows users to search for GIFs using the Giphy API. 
The app displays a grid of GIFs based on the user's search query and provides a detail view for each GIF.

## Features

- Search for GIFs by entering a query in the search bar
- View a grid of GIFs based on the search query
- Load more GIFs as the user scrolls to the end of the grid
- Tap on a GIF to view its detail page
- Default GIFs are loaded when the app starts

## Screenshots

![Simulator Screenshot - iPhone 14 Pro - 2023-07-22 at 20 11 13](https://github.com/marislakss/gif-search-swiftui-giphy-api/assets/106552140/29e3ca44-39a5-48a5-a1cf-a4d9a1c8dd2f)
![Simulator Screenshot - iPhone 14 Pro - 2023-07-22 at 20 11 34](https://github.com/marislakss/gif-search-swiftui-giphy-api/assets/106552140/a827daba-834c-411e-99e9-390c0bcf5fda)
![Simulator Screenshot - iPhone 14 Pro - 2023-07-22 at 20 12 11](https://github.com/marislakss/gif-search-swiftui-giphy-api/assets/106552140/c6b623a9-498c-4dd9-ac65-716d047914d2)

## Getting Started

To run the app locally, follow these steps:

1. Clone the repository:

git clone [repository-url]


2. Open the project in Xcode:

cd GifSearchApp
open GifSearchApp.xcodeproj


3. Add your Giphy API key:

Replace the placeholder value with your actual Giphy API key in the `APIClient.swift` file:

private let apiKey = "YOUR_API_KEY"


4. Build and run the app in Xcode.


## Dependencies

• RxSwift
• RxCocoa
• Alamofire (for network requests)
• SDWebImage (for image loading and caching)

The app uses the following dependencies, which are managed using Swift Package Manager:

• SDWebImageSwiftUI: For loading and displaying GIF images
• Combine: For reactive programming and handling asynchronous operations
  Architecture

The app follows the MVVM (Model-View-ViewModel) architecture pattern. The key components are:

• Views: SwiftUI views that display the user interface.
• ViewModel: Handles the business logic and data flow for the views. Communicates with the API 
  client and provides data for the views to display.
• APIClient: Responsible for making network requests to the Giphy API and parsing the response.
• Models: Data models used to represent GIFs and API responses.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please 
open an issue or submit a pull request.
