//
//  CoreDataManager.swift
//  +
//
//  Created by Jeremy Jackman on 9/3/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer : NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to init Core Data \(error)")
            }
        }
    }
}
