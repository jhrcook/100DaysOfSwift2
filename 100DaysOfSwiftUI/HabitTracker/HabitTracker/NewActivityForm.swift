//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Joshua on 7/7/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

struct NewActivityForm: View {
    
    @ObservedObject var activities: Activities
    
    @State private var name: String = ""
    @State private var description: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Activity", text: $name)
                    .padding()
                TextField("Description", text: $description)
                    .padding()
            }
            .navigationBarTitle("Add a new activity")
            .navigationBarItems(trailing: Button(action: {
                let newActivity = Activity(title: self.name, description: self.description)
                self.activities.activities.append(newActivity)
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
            })
        }
    }
}

struct NewActivityForm_Previews: PreviewProvider {
    static var previews: some View {
        NewActivityForm(activities: Activities())
    }
}
