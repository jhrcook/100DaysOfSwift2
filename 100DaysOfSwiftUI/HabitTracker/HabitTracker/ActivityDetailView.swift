//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Joshua on 7/7/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    
    @ObservedObject var activities: Activities
    let index: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(activities.activities[index].title)
                .font(.system(.title))
                .padding()
            Text(activities.activities[index].description)
                .font(.system(.body))
                .multilineTextAlignment(.leading)
                .padding()
            HStack {
                Spacer()
                Button(action: {
                    var activity = self.activities.activities[self.index]
                    activity.count += 1
                    self.activities.activities[self.index] = activity
                }) {
                    Image(systemName: "plus")
                        .font(.system(.title))
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                Spacer()
                Text("\(self.activities.activities[self.index].count)")
                Spacer()
            }
            Spacer()
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activities: Activities(), index: 0)
    }
}
