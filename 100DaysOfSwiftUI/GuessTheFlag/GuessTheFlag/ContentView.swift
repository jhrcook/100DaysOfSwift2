//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Joshua on 4/9/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    
    var body: some View {
        Button(action: {
            self.showAlert = true
        }) {
            Text("Show alert")
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Hello, SwiftUI."), message: Text("This is some detail message."), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
