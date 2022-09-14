//
//  EditWorkoutRoutineView.swift
//  +
//
//  Created by Jeremy Jackman on 9/7/22.
//

import SwiftUI

struct EditWorkoutRoutineView: View {
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var workoutRoutine: WorkoutRoutine
    @Binding var exercises: [Exercise]
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    init(workoutRoutine: WorkoutRoutine) {
        self.workoutRoutine =  workoutRoutine
        _exercises = Binding<[Exercise]>(get: {
            workoutRoutine.exercises!.allObjects as! [Exercise]
        }, set: { newExercises in
            workoutRoutine.exercises = NSSet(array: newExercises)
        })
    }
    
    
    
    var body: some View {
        
            Form {
                Section(header: Text("Name of my Workout")){
                    Text("EditWorkoutRoutine")
                    TextField("Workout Name", text: $workoutRoutine.title ?? "")
                }
                
                Section(header: Text("Exercises")){
                    ForEach(exercises) { exercise in
                        ExerciseCell(exercise: exercise)
                    }
                    
                }
                
                Section() {
                    // NO Need for a Save Button
                    Button("Add Exercise", action: addExercise)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            
                Button("Save") {
                    saveCoreDataContext()
                    // TODO: dismiss the modal
                    
                }
            
            .onDisappear {
                viewContext.rollback()
            }
            .onAppear {
                saveCoreDataContext()
            }
        
        
    }
    
    func addExercise() {
        withAnimation {
            let exercise = Exercise(context: viewContext)
            exercise.title = ""
            exercise.desc = ""
            exercise.reps = 0
            exercise.sets = 0
            exercise.timer = 0
            exercises.append(exercise)
        }
    }
    
    func saveCoreDataContext() {
        do {
           try viewContext.save()
        }
        catch {
            print(error)
            // Problem with the save func
            fatalError()
        }
    }
}

struct EditWorkoutRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkoutRoutineView(workoutRoutine: WorkoutRoutine())
    }
}


