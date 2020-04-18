//
//  ContentView.swift
//  BrainTrainingChallenge
//
//  Created by Joshua on 4/17/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

extension Color {
    static let MyPink = Color(hue: 3.0/255.0, saturation: 39.0/200.0, brightness: 1.0)
    static let MyBlue = Color(hue: 208.0/255.0, saturation: 49.0/200.0, brightness: 1.0)
    static let MyYellow = Color(hue: 64.0/255.0, saturation: 59.0/200.0, brightness: 1.0)
    static let ButtonColor = Color(hue: 267.0/255.0, saturation: 48.0/100.0, brightness: 40.0/100.0)
}


struct TitleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}


struct GameButton: View {
    var text: String
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            HStack {
                Image(systemName: self.imageName)
                    .font(.title)
                    .foregroundColor(.white)
                Text(self.text)
                    .font(.title)
                    .foregroundColor(.white)
            }
            .frame(minWidth: 100, maxWidth: .infinity)
            .background(Color.ButtonColor)
            .cornerRadius(40)
            .padding(.horizontal, 10)
        })
    }
}


struct ContentView: View {
    
    var playersScore: Int = 0
    
    var optionImages = ["aspectratio.fill", "paperclip.circle.fill", "scissors"]
    var gameOptions = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.MyPink, .MyBlue, .MyYellow]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 30) {
                TitleText(text: "Score: \(playersScore)")
                Spacer()
                HStack(spacing: 20) {
                    TitleText(text: "Win")
                    Text("against")
                    TitleText(text: "Rock")
                }
                Spacer()
                HStack(spacing: 0) {
                    ForEach(0 ..< gameOptions.count) { i in
                        GameButton(text: self.gameOptions[i], imageName: self.optionImages[i]) {
                            print("Hello")
                        }
                    }
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
