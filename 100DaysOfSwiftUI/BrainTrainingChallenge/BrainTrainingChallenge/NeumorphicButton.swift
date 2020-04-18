//
//  NeumorphicButton.swift
//  BrainTrainingChallenge
//
//  Created by Joshua on 4/18/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct NeumorphicButton: View {
    var label: String
    var action: () -> Void
    
    var labelColor = UIColor(hue: 1.0, saturation: 0.0, brightness: 0.234, alpha: 1.0)
    var buttonColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
    
    var body: some View {
        VStack{
            Button(action: {
                self.action()
            }, label: {
                Text(self.label)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundColor(Color(self.labelColor))
                    .frame(width: 240, height: 80)
                    .background(
                        ZStack{
                            Color(self.buttonColor)
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .padding(2)
                                .blur(radius: 2)
                        }
                )
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.5)), radius: 20, x: -20, y: -20)
            })
        }
    }
}


struct NeumorphicButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.MyPink, .MyBlue, .MyYellow]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 80) {
                NeumorphicButton(label: "Button", action: {
                    print("Hello")
                })
                NeumorphicButton(label: "Button", action: {
                    print("Hello")
                }, labelColor: .blue, buttonColor: .red)
            }
        }
    }
}
