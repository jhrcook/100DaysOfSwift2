//
//  Commit+CoreDataProperties.swift
//  Project 38 - GitHub Commits
//
//  Created by Joshua on 3/25/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//
//

import Foundation
import CoreData


extension Commit {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Commit> {
        return NSFetchRequest<Commit>(entityName: "Commit")
    }

    @NSManaged public var date: Date
    @NSManaged public var message: String
    @NSManaged public var sha: String
    @NSManaged public var url: String

}
