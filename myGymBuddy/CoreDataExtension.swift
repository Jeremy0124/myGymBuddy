//
//  CoreDataExtension.swift
//  +
//
//  Created by Jeremy Jackman on 9/7/22.
//

import Foundation
import CoreData

extension WorkoutRoutine {
    var exercisesArray: [Exercise] {
        let exercises = exercises?.allObjects as? [Exercise] ?? []
        return exercises.sorted(by: {$0.sortIndex < $1.sortIndex})
    }
}

extension Exercise {
    static var example: Exercise {
        
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: NSFetchRequest<Exercise> = Exercise.fetchRequest()
        
        let results = try? context.fetch(fetchRequest)
        
        return (results?.first!)!
    }
}
