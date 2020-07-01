//
//  ContentView.swift
//  Moonshot
//
//  Created by Joshua on 7/1/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ScrollViewIntro: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<100) {i in
                        HStack() {
                            Text("Item: \(i)")
                                .font(.title)
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationBarTitle("A scroll view")
        }
    }
}

struct ScrollViewIntro_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewIntro()
    }
}
