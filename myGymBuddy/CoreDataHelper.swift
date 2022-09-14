//
//  CoreDataHelper.swift
//  MyGymBuddy
//
//  Created by Jeremy Jackman on 9/14/22.
//

import Foundation
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    var viewContext = PersistenceController.shared.container.viewContext
    
    func deleteWorkOutRoutine(workoutRoutine: WorkoutRoutine) {
        viewContext.delete(workoutRoutine)
        save()
    }
    
    func deleteExercise(exercise: Exercise) {
        viewContext.delete(exercise)
        save()
    }
    
    func save() {
        try? viewContext.save()
    }
}
