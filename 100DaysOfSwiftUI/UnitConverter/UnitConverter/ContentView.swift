//
//  ContentView.swift
//  UnitConverter
//
//  Created by Joshua on 4/8/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let temperatureUnits = ["Fahrenheit", "Celsius"]
    
    @State private var inputUnit = 0
    
    @State private var inputValue = ""
        private var outputValue: Double {
            if let numericInput = Double(inputValue) {
                if inputUnit == 0 {
                    return (numericInput - 32.0) * 5.0 / 9.0
                } else {
                    return (numericInput * 9.0 / 5.0) + 32.0
                }
            } else {
                return 0.0
            }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input value")) {
                    TextField("Starting temperature", text: $inputValue)
                }
                
                Section(header: Text("Input unit")) {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(0 ..< temperatureUnits.count) {
                            Text(self.temperatureUnits[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output value")) {
                    Text("\(outputValue, specifier: "%.2f") º\(inputUnit == 0 ? "C" : "F")")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
