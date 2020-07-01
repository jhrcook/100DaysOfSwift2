//
//  ContentView.swift
//  Moonshot
//
//  Created by Joshua on 7/1/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct NavigationLinkIntro: View {
    var body: some View {
        NavigationView {
            List(0..<100) {row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
                .navigationBarTitle("SwiftUI List")
            }
        }
    }
}

struct NavigationLinkIntro_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkIntro()
    }
}
