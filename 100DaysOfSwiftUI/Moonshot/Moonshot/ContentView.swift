//
//  ContentView.swift
//  Moonshot
//
//  Created by Joshua on 7/1/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json") 
    
    var body: some View {
        NavigationView {
            List(missions) {mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    MissionViewRow(mission: mission)
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
