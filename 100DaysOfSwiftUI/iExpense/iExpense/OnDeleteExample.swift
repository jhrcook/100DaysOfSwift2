//
//  ContentView.swift
//  iExpense
//
//  Created by Joshua on 6/29/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct OnDeleteExample: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                // A list of all values in `numbers`.
                List {
                    ForEach(numbers, id: \.self) {
                        // The row just shows each value.
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                // A button to add the next number to `numbers`.
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
                
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    // Remove a row at a specified offset.
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
}

struct OnDeleteExample_Previews: PreviewProvider {
    static var previews: some View {
        OnDeleteExample()
    }
}
