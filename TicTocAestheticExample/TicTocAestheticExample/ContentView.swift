//
//  ContentView.swift
//  TicTocAestheticExample
//
//  Created by Joshua on 6/30/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct TikTokEffect: ViewModifier {
    let offset: CGSize
    
    func negOffset()->CGSize {
        return CGSize(width: -self.offset.width, height: -self.offset.height)
    }
    
    func body(content: Content) -> some View {
        content
            .offset(self.negOffset())
            .foregroundColor(Color("tiktokRed"))
            .blendMode(.plusLighter)
            .overlay(
                content
                    .foregroundColor(Color("tiktokBlue"))
                    .blendMode(.plusLighter)
                    .offset(self.offset)
            )
            
    }
}



struct ContentView: View {
    
    @State private var isOffSet = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
                Image(systemName: "sun.dust.fill")
                    .font(.system(size: 300, weight: .bold, design: .default))
                    .modifier(TikTokEffect(offset: CGSize(width: isOffSet ? -4 : 0, height: isOffSet ? -3 : 0)))
                    .onAppear {
                        withAnimation(Animation.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.5).repeatForever(autoreverses: false)) {
                            self.isOffSet.toggle()
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
