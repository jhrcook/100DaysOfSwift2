//
//  Activities.swift
//  HabitTracker
//
//  Created by Joshua on 7/7/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI

class Activities: ObservableObject {
    @Published var activities = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            if let encodedActivities = try? encoder.encode(activities) {
                let defaults = UserDefaults.standard
                defaults.set(encodedActivities, forKey: "SavedActivities")
            }
        }
    }
    
    init() {
        let defaults = UserDefaults.standard
        if let savedActivities = defaults.object(forKey: "SavedActivities") as? Data {
            let decoder = JSONDecoder()
            if let loadedActivities = try? decoder.decode([Activity].self, from: savedActivities) {
                self.activities = loadedActivities
            }
        }
    }
}
