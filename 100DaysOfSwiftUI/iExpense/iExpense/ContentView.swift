//
//  ContentView.swift
//  iExpense
//
//  Created by Joshua on 6/29/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


struct CodableUser: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    
    @State private var user = CodableUser(firstName: "Josh", lastName: "Cook")
    
    var body: some View {
        VStack(spacing: 20.0) {
            Button("Save User") {
                // Instantiate an encoder object.
                let encoder = JSONEncoder()
                // Try to encode the data into a Data object.
                if let data = try? encoder.encode(self.user) {
                    // Save Data object to disk using UserDefaults.
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
