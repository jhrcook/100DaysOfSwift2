//
//  MissionView.swift
//  Moonshot
//
//  Created by Joshua on 7/2/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


fileprivate struct CrewMember {
    let role: String
    let astronaut: Astronaut
}



struct CrewMemberView: View {
    fileprivate let crewMember: CrewMember
    var body: some View {
        HStack{
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 83, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color.primary, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .font(.headline)
                Text(crewMember.role)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}



struct MissionView: View {
    
    let mission: Mission
    fileprivate let astronauts: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    HStack{
                        Text("Launch date: \(self.mission.formattedLaunchDate)")
                            .padding()
                        Spacer()
                    }
                    
                    Text(self.mission.description)
                        .padding()
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                            CrewMemberView(crewMember: crewMember)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
}



struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts )
    }
}
