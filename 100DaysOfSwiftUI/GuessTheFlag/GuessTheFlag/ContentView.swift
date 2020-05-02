//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Joshua on 4/9/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}



struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var score = 0
    
    @State private var rotationAmounts = [0.0, 0.0, 0.0]
    @State private var opacityAmounts = [1.0, 1.0, 1.0]
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of ")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(country: self.countries[number])
                            .rotation3DEffect(.degrees(self.rotationAmounts[number]), axis: (x: 0, y: 1, z: 0))
                            .opacity(self.opacityAmounts[number])
                    }
                }
                
                Text("Current score: \(score)")
                    .font(.callout)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
        }
    }
    
    // Called when the flag is tapped to send an alert.
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            withAnimation {
                rotationAmounts[number] += 360
                opacityAmounts = [0.2, 0.2, 0.2]
                opacityAmounts[number] = 1.0
            }
            score += 1
            scoreTitle = "Correct"
            scoreMessage = "Your score is \(score)"
        } else {
            score -= 1
            scoreTitle = "Wrong"
            scoreMessage = "Incorrect, that is the flag of \(countries[number]). Your score is \(score)"
        }
        showingScore = true
    }
    
    
    // Call to present a new flag to guess.
    func askQuestion() {
        opacityAmounts = [1.0, 1.0, 1.0]
        rotationAmounts = [0.0, 0.0, 0.0]
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
