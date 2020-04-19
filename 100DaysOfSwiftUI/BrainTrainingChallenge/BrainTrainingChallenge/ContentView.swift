//
//  ContentView.swift
//  BrainTrainingChallenge
//
//  Created by Joshua on 4/17/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


let rectCornerRad: CGFloat = 20.0


struct ScoreText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.system(size: 70, weight: .semibold, design: .rounded))
            .foregroundColor(.white)
    }
}

struct TitleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(.black)
    }
}


extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}


struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(RoundedRectangle(cornerRadius: rectCornerRad))
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius:rectCornerRad)
                            .fill(Color.offWhite)
                            .overlay(
                                RoundedRectangle(cornerRadius: rectCornerRad)
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(
                                    RoundedRectangle(cornerRadius: rectCornerRad)
                                        .fill(LinearGradient(Color.black, Color.clear))
                                    )
                            )
                    } else {
                        RoundedRectangle(cornerRadius:rectCornerRad)
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
            .animation(.easeInOut(duration: 5))
    }
}


struct ButtonText: View {
    var label: String
    
    init(_ label: String) {
        self.label = label
    }
    
    var body: some View {
        Text(self.label)
            .font(.system(size: 30, weight: .regular, design: .rounded))
            .foregroundColor(Color.blueGray)
    }
}



struct ContentView: View {
    
    var playersScore: Int = 0
    
    var optionImages = ["aspectratio.fill", "paperclip.circle.fill", "scissors"]
    var gameOptions = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            
            Color.offWhite.edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 30) {
                ForEach(0 ..< gameOptions.count) { i in
                    Button(action: {
                        print("Button tapped.")
                    }, label: {
                        ButtonText(self.gameOptions[i])
                    })
                    .buttonStyle(NeumorphicButtonStyle())
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
