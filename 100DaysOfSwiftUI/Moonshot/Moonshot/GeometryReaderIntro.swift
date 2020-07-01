//
//  ContentView.swift
//  Moonshot
//
//  Created by Joshua on 7/1/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct GeometryReaderIntro: View {
    var body: some View {
        VStack {
            GeometryReader {geo in
                Image("duke")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
            .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct GeometryReaderIntro_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderIntro()
    }
}
