//
//  ContentView.swift
//  BrainTrainingChallenge
//
//  Created by Joshua on 4/17/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct TitleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}



struct ContentView: View {
    
    var playersScore: Int = 0
    
    var optionImages = ["aspectratio.fill", "paperclip.circle.fill", "scissors"]
    var gameOptions = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.MyPink, .MyBlue, .MyYellow]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            Color(red: 0.9, green: 0.9, blue: 0.9).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 30) {
                TitleText(text: "Score: \(playersScore)")
                Spacer()
                HStack(spacing: 20) {
                    TitleText(text: "Win")
                    Text("against")
                    TitleText(text: "Rock")
                }
                Spacer()
                VStack(spacing: 40) {
                    ForEach(0 ..< gameOptions.count) { i in
                        NeumorphicButton(label: self.gameOptions[i], action: {
                            print("Hello")
                        })
                    }
                }
                .padding(20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
