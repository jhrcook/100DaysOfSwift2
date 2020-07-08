//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Joshua on 7/8/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

// MARK: Codable with @Published property wrapper.

enum CodingKeys: CodingKey {
    case name
}

class User: ObservableObject, Codable {
    @Published var name = "Josh Cook"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}


// MARK: Reading data from the internet.

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct TaylorSwiftListView: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
    .onAppear(perform: loadData)
    }
    
    
    func loadData() {
        // 1. Create a URL to Apple's iTunes library.
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        // 2. Make a request.
        let request = URLRequest(url: url)
        
        // 3. Create and start a networking task.
        URLSession.shared.dataTask(with: request) {data, response, error in
            // 4. Handle the result.
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct TaylorSwiftListView_Previews: PreviewProvider {
    static var previews: some View {
        TaylorSwiftListView()
    }
}
