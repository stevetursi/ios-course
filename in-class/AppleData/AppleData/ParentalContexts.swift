//
//  ParentalContexts.swift
//  ParentalContexts
//
//  Created by Matthew Gambill on 9/7/15.
//  Copyright (c) 2015 Matthew Gambill. All rights reserved.
//

import Foundation
import CoreData

public class ParentalContexts: NSObject {
    
    // MARK: Properties
    let momIdentifier: String
    let persistentStoreURL: NSURL
    
    // MARK: Init
    public init(momIdentifier: String) {
        self.momIdentifier = momIdentifier
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let applicationDocumentsDirectory = urls[urls.count-1]
        self.persistentStoreURL = applicationDocumentsDirectory.URLByAppendingPathComponent("\(momIdentifier).sqlite")
    }
    
    public init(momIdentifier: String, persistentStoreURL: NSURL) {
        self.momIdentifier = momIdentifier
        self.persistentStoreURL = persistentStoreURL
    }
    
    // MARK: Managed Object Model
    private lazy var managedObjectModel: NSManagedObjectModel? = {
        guard let modelURL = NSBundle.mainBundle().URLForResource(self.momIdentifier, withExtension: "momd") else {
            return nil
        }
        return NSManagedObjectModel(contentsOfURL: modelURL)
    }()
    
    // MARK: Peresistent Store Coordinator
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        guard let managedObjectModel = self.managedObjectModel else {
            return nil
        }
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: self.persistentStoreURL, options: nil)
        } catch {
            // error condition
            // TODO: Handle error condition
            fatalError()
        }
        return persistentStoreCoordinator
    }()
    
    // MARK: Managed Object Contexts
    private lazy var writeManagedObjectContext: NSManagedObjectContext? = {
        guard let persistentStoreCoordinator = self.persistentStoreCoordinator else {
            return nil
        }
        
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        return managedObjectContext
    }()
    
    public lazy var mainManagedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.parentContext = self.writeManagedObjectContext
        return managedObjectContext
    }()
    
    public lazy var updateManagedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        managedObjectContext.parentContext = self.mainManagedObjectContext
        return managedObjectContext
    }()
}

// MARK: Save
extension ParentalContexts {
    public func save() {
        updateManagedObjectContext.performBlockAndWait({ () -> Void in
            self.saveManagedObjectContext(self.updateManagedObjectContext)
        })
        mainManagedObjectContext.performBlockAndWait({ () -> Void in
            self.saveManagedObjectContext(self.mainManagedObjectContext)
        })
        writeManagedObjectContext?.performBlock({ () -> Void in
            self.saveManagedObjectContext(self.writeManagedObjectContext)
        })
    }
    
    private func saveManagedObjectContext(managedObjectContext: NSManagedObjectContext?) {
        guard let managedObjectContext = managedObjectContext else {
            return
        }
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // error condition
                // TODO: Handle error condition
                fatalError()
            }
        }
    }
}