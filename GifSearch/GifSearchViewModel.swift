//
//  GifSearchViewModel.swift
//  GifSearch
//
//  Created by Māris Lakšs on 04/05/2023.
//
import Combine
import Foundation

class GifSearchViewModel: ObservableObject {
    // MARK: - Published Properties

    @Published private(set) var gifs: [Gif] = []
    @Published var isLoading = false

    // MARK: - Other Properties

    var searchText = "" {
        didSet {
            // Trim whitespace characters from the search text
            let trimmedText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

            // Check if the trimmed search text is empty or contains only spaces
            guard !trimmedText.isEmpty, !trimmedText.contains(" ") else {
                gifs = []
                offset = 0 // Reset the offset to 0
                return
            }

            searchGifs()
        }
    }

    private let apiClient: APIClient
    private var offset = 0
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient

        performDefaultSearch()
    }

    // MARK: - Public Methods

    func loadMoreGifs() {
        guard !isLoading else { return }
        searchGifs()
    }

    // MARK: - Private Methods

    private func performDefaultSearch() {
        let defaultQuery = "coding"
        let defaultOffset = 0

        apiClient.searchGifs(query: defaultQuery, offset: defaultOffset)
            .receive(on: DispatchQueue.main) // Switch to the main thread
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    print("Error loading default gifs: \(error)")
                }
            }, receiveValue: { [weak self] gifs in
                DispatchQueue.main.async { // Perform updates on the main thread
                    self?.gifs = gifs
                }
            })
            // Store the cancellable in the cancellables set for proper memory management
            .store(in: &cancellables)
    }

    private func searchGifs() {
        let trimmedText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        // Check if the trimmed search text is empty or contains only spaces
        guard !trimmedText.isEmpty, !trimmedText.contains(" ") else {
            gifs = []
            isLoading = false
            return
        }

        isLoading = true

        apiClient.searchGifs(query: trimmedText, offset: offset)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { [weak self] completion in
                guard let self else { return }

                switch completion {
                case .finished:
                    self.isLoading = false
                case let .failure(error):
                    print("Error loading gifs: \(error)")
                    self.gifs = []
                    self.isLoading = false
                }
            })
            .sink(receiveCompletion: { [weak self] completion in
                guard let self else { return }

                switch completion {
                case .finished:
                    self.isLoading = false
                case let .failure(error):
                    print("Error loading gifs: \(error)")
                    self.gifs = []
                    self.isLoading = false
                }
            }, receiveValue: { [weak self] gifs in
                guard let self else { return }

                self.offset += gifs.count
                self.gifs = gifs
            })
            .store(in: &cancellables)
    }
}
