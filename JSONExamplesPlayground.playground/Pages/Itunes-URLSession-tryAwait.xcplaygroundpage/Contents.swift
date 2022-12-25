//: [Previous](@previous)

import Foundation
//import _Concurrency
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


struct ITunesResult: Codable {
    let results: [Album]
}

struct Album: Codable, Hashable {
    let collectionId: Int
    let collectionName: String
    let collectionPrice: Double
}



struct AlbumsFetcher {
    
    enum AlbumsFetcherError: Error {
           case invalidURL
           case missingData
       }
    
    
    static func fetchAlbumWithAsyncURLSession() async throws -> [Album] {

        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=album") else {
            throw AlbumsFetcherError.invalidURL
        }

        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, _) = try await URLSession.shared.data(from: url)

        // Parse the JSON data
        let iTunesResult = try JSONDecoder().decode(ITunesResult.self, from: data)
        return iTunesResult.results
    }
    
}

Task {
    do {
        let results = try await AlbumsFetcher.fetchAlbumWithAsyncURLSession()
        for i in 1...10 {
            print(results[i].collectionName)
        }
    }
}
//: [Next](@next)
