//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Joshua on 7/9/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
        
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("You total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order") {
                        // Place the order!
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
