//
//  Contact+CoreDataProperties.swift
//  AppleData
//
//  Created by Steven Tursi on 8/15/16.
//  Copyright © 2016 Steven Tursi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var age: NSNumber?

}
