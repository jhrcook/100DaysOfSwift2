//
//  ContentView.swift
//  iExpense
//
//  Created by Joshua on 6/29/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bill"
    @Published var lastName = "Cook"
}

struct ObservalbleObjectExample: View {
    // The ObservableObject property wrapper allows us to use `class` objects
    // so that values can be sent to different views.
    @ObservedObject private var user = User()
    
    var body: some View {
        VStack {
            Text("User is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ObservalbleObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        ObservalbleObjectExample()
    }
}
