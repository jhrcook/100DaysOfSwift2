//
//  ContentView.swift
//  Animations
//
//  Created by Joshua on 4/29/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount: CGFloat = 1.0
    
    var body: some View {
        Button("Tap Me") {
            // do nothing
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(Color.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(Animation.easeInOut(duration: 1.0)
                    .repeatForever(autoreverses: false))
        )
            .onAppear {
                self.animationAmount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
