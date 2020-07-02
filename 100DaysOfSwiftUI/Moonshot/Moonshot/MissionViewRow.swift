//
//  MissionViewRow.swift
//  Moonshot
//
//  Created by Joshua on 7/2/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct MissionViewRow: View {
    
    let mission: Mission
    
    var body: some View {
        HStack{
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading) {
                Text(mission.displayName)
                    .font(.headline)
                Text(mission.formattedLaunchDate)
            }
        }
    }
}

struct MissionViewRow_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionViewRow(mission: missions[0])
    }
}
