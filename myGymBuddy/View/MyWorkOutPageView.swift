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
        
        NavigationView {
            VStack {
                ZStack {
                    List {
                        ForEach(workoutRoutine.exercisesArray) {exercise in NavigationLink(destination: EditExerciseView(exercise: exercise)) {
                            ExerciseCell(exercise: exercise)
                            
                        }
                            
                        }
                        .onDelete(perform: deleteItems)
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
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            //  offsets.map { Exercise[$0] }.forEach(viewContext.delete)
        }
    }
    
}

struct MyWorkOutPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyWorkOutPageView(workoutRoutine: WorkoutRoutine())
    }
}
