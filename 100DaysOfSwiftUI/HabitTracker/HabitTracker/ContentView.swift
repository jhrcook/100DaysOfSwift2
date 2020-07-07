//
//  ContentView.swift
//  HabitTracker
//
//  Created by Joshua on 7/7/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activities) { activity in
                    NavigationLink(
                        destination: ActivityDetailView(activities: self.activities, index: self.activities.activities.firstIndex(where: { $0.id == activity.id })!)
                    ) {
                        HStack {
                            Text(activity.title).padding()
                            Spacer()
                            Text("\(activity.count)").padding()
                        }
                    }
                }
                .onDelete(perform: removeActivity)
            }
            .navigationBarItems(trailing: Button(action: {
                self.showingAddActivity = true
            }, label: {
                Image(systemName: "plus")
            }))
                .navigationBarTitle("Habit Tracker")
        }
        .sheet(isPresented: $showingAddActivity) {
            NewActivityForm(activities: self.activities)
        }
    }
    
    func removeActivity(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
