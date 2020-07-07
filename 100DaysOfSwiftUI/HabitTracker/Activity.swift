//
//  Activity.swift
//  HabitTracker
//
//  Created by Joshua on 7/7/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import Foundation

struct Activity: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var count: Int = 0
}
