//
//  ContextViewTwo.swift
//  Animations
//
//  Created by Joshua on 4/29/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ContextViewTwo: View {
    
    @State private var animationAmount: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 0.3)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(Color.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct ContextViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ContextViewTwo()
    }
}
