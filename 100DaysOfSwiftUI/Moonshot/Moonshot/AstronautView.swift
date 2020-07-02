//
//  AstronautView.swift
//  Moonshot
//
//  Created by Joshua on 7/2/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    private var missions = [Mission]()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Missions")
                        .font(.headline)
                    
                    ForEach(self.missions) {mission in
                        HStack {
                            MissionViewRow(mission: mission)
                                .padding()
                            Spacer()
                        }
                    }
                }
            }
        }.navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        // Get all missions that the astronaut was in.
        var matches = [Mission]()
        let missions: [Mission] = Bundle.main.decode("missions.json")
        for mission in missions {
            for member in mission.crew {
                if member.name == astronaut.id {
                    matches.append(mission)
                }
            }
        }
        
        self.missions = matches
    }
    
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
