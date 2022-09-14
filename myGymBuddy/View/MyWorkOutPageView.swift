//
//  MyWorkOutPageView.swift
//  myGymBuddy
//
//  Created by Jeremy Jackman on 8/23/22.
//

import SwiftUI
import CoreData

struct MyWorkOutPageView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var workoutRoutine: WorkoutRoutine
    
    var body: some View {
            Text("MyWorkOutPageView")
       
            VStack {
                ZStack {
                    List {
                        ForEach(workoutRoutine.exercisesArray) {exercise in NavigationLink(destination: EditExerciseView(exercise: exercise)) {
                            ExerciseCell(exercise: exercise)
                            
                        }
                            
                        }
                    }
                }
            }
        
    }
    
    func savedContext(_ context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
    
}

struct MyWorkOutPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyWorkOutPageView(workoutRoutine: WorkoutRoutine())
    }
}
