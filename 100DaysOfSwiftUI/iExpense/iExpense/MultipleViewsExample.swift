//
//  ContentView.swift
//  iExpense
//
//  Created by Joshua on 6/29/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


struct SecondView: View {
    // Get the `presentationMode` value from the environment.
    @Environment(\.presentationMode) var presentationMode
    var name: String
        
    var body: some View {
        // A button that dismisses the view when tapped.
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}


struct MultipleViewsExample: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack(spacing: 40.0) {
            // A button to toggle `showingSheet`.
            Button("Show Sheet") {
                self.showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Josh")
            }
            
            // Text showing the current value of `showingSheet`.
            Text("`showingSheet` = \(showingSheet ? "true" : "false")")
        }
    }
}

struct MultipleViewsExample_Previews: PreviewProvider {
    static var previews: some View {
        MultipleViewsExample()
    }
}
