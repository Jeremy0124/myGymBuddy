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
    
    struct CompleteButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(20)
                .background(Color(.green))
                .foregroundColor(Color(.white))
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.5 : 1)
                .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    var body: some View {
        Text("MyWorkOutPageView")
        Text(workoutRoutine.title ?? "My Workout")
            .font(.title)
        
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
//        VStack {
//                Button("Workout Complete!", action: workoutComplete)
//                .buttonStyle(CompleteButton())
//        }
    }
    
//    func workoutComplete() {
//        exercise.isComplete = false
//        print("workoutComplete button works")
//    }
    
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
