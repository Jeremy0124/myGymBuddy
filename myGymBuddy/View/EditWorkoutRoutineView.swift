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
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    init(workoutRoutine: WorkoutRoutine) {
        self.workoutRoutine =  workoutRoutine
    }
    
    var body: some View {
        // Text("EditWorkoutRoutineView")
        NavigationView {
            List {
                Section(header: Text("Name of my Workout")){
                    TextField("Workout Name", text: $workoutRoutine.title ?? "")
                }
                Section(header: Text("Exercises")){
                    ForEach(workoutRoutine.exercisesArray) { exercise in
                        ExerciseCell(exercise: exercise, isEditing: true)
                    }
                    .onMove(perform: move)
                }
                Section() {
                    // NO Need for a Save Button
                    Button("Add Exercise", action: addExercise)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Button("Save my Workout") {
                            saveCoreDataContext()
                            presentationMode.wrappedValue.dismiss()
                        }
                        .buttonStyle(SaveButton())
                        .offset(x: 90)
                    }
                }
            }
            .toolbar {
                EditButton()
            }
            .onDisappear {
                viewContext.rollback()
            }
            .onAppear {
                saveCoreDataContext()
            }
        }
    }
    
    func addExercise() {
        withAnimation {
            let exercise = Exercise(context: viewContext)
            exercise.title = ""
            exercise.desc = ""
            exercise.reps = 10
            exercise.sets = 3
            exercise.timer = 0
            exercise.weight = 50
            exercise.id = UUID()
            exercise.sortIndex = Int64(workoutRoutine.exercisesArray.count)
            workoutRoutine.addToExercises(exercise)
            PersistenceController.shared.save()
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        var resortedExercises = workoutRoutine.exercisesArray
        resortedExercises.move(fromOffsets: source, toOffset: destination)
        for exercise in resortedExercises {
            exercise.sortIndex = Int64(resortedExercises.firstIndex(of: exercise) ?? 0)
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


