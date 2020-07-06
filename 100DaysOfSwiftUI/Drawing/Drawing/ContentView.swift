//
//  ContentView.swift
//  Drawing
//
//  Created by Joshua on 7/4/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}


struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

struct Flower: Shape {
    // How much to move each petal away from the center.
    var petalOffset: Double = -20

    // How wide to make each petal.
    var petalWidth: Double = 100

    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals.
        var path = Path()

        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)

            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))

            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))

            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            // add it to our main path
            path.addPath(rotatedPetal)
        }

        // now send the main path back
        return path
    }
}

struct FilledCircle: View {
    
    let fillColor: Color
    @Binding var amount: CGFloat
    let offset: CGSize
    
    var body: some View {
        Circle()
            .fill(fillColor)
            .frame(width: 200 * amount)
            .offset(offset)
            .blendMode(.screen)
            .saturation(Double(amount))
            .blur(radius: (1.0 - amount) * 20.0)
    }
}


struct Trapezoid: Shape {
    
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}


struct ContentView: View {
    
//    @State private var amount: CGFloat = 100.0
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
    @State private var insetAmount: CGFloat = 50.0
    
    var body: some View {
//        VStack(spacing: 30) {
//            Triangle()
//                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//                .padding()
//                .scaledToFit()
//
//            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//                .frame(width: 300, height: 300)
//        }
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .fill(Color.red, style: FillStyle(eoFill: true))
//
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding()
//
//            Text("Width")
//            Slider(value: $petalWidth, in: 0...100)
//                .padding()
//        }
        
//        ZStack {
//            Image("yan_chess")
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.screen)
//        }
//        .frame(width: 400, height: 500)
//        .clipped()
        
//        VStack {
//            ZStack {
//                FilledCircle(fillColor: .red, amount: $amount, offset: CGSize(width: -50, height: -80))
//                FilledCircle(fillColor: .green, amount: $amount, offset: CGSize(width: 50, height: -80))
//                FilledCircle(fillColor: .blue, amount: $amount, offset: CGSize(width: 0, height: 0))
//            }
//            .frame(width: 300, height: 300)
//
//            Slider(value: $amount).padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black)
//        .edgesIgnoringSafeArea(.all)
        
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
