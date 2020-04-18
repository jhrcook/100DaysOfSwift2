//
//  ContentView.swift
//  BrainTrainingChallenge
//
//  Created by Joshua on 4/17/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


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



struct ContentView: View {
    
    var playersScore: Int = 0
    
    var optionImages = ["aspectratio.fill", "paperclip.circle.fill", "scissors"]
    var gameOptions = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 30) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.MyPurple, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .cornerRadius(30)
                        .shadow(color: .black, radius: 20)
                        .edgesIgnoringSafeArea(.all)
                        
                    VStack {
                        
                        Spacer()
                        
                        ScoreText(text: "Score: \(playersScore)")
                        
                        Spacer()
                        
                        ZStack{
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                                .cornerRadius(30)
                                .frame(width: 340, height: 70)
                                .shadow(color: .black, radius: 20)
                            HStack(spacing: 20) {
                                TitleText(text: "Win")
                                Text("against")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                TitleText(text: "Rock")
                            }
                        }
                        .padding(-35)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                Spacer()
                
                VStack(spacing: 40) {
                    ForEach(0 ..< gameOptions.count) { i in
                        NeumorphicButton(label: self.gameOptions[i], action: {
                            print("Hello")
                        })
                    }
                }
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
