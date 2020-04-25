//
//  ContentView.swift
//  WordScramble
//
//  Created by Joshua on 4/24/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Josh", "Helene", "Mom", "Dad"]
    
    var body: some View {
        
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // Do something with the file...
            }
        }
        
        return Text("hi")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
