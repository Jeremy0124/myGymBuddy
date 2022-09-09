//
//  CoreDataExtension.swift
//  +
//
//  Created by Jeremy Jackman on 9/7/22.
//

import Foundation

extension WorkoutRoutine {
    var exercisesArray: [Exercise] {
        return exercises?.allObjects as? [Exercise] ?? []
    }
}
