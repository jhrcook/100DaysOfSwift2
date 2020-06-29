//
//  ContentView.swift
//  iExpense
//
//  Created by Joshua on 6/29/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct UserDefaultsExample: View {
    static let tapKey = "Tap"
    @State private var tapCount = UserDefaults.standard.integer(forKey: tapKey)
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            // Increment tapCount by +1.
            self.tapCount += 1
            // Save to UserDefults.standard ("stringly" typed).
            UserDefaults.standard.set(self.tapCount, forKey: UserDefaultsExample.tapKey)
        }
    }
}

struct UserDefaultsExample_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsExample()
    }
}
