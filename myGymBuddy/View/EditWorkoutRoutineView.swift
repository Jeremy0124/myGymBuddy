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
    @State var workoutRoutine: WorkoutRoutine?
    @State var workoutTitle: String
    

    @State var exercises: [Exercise]
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    init(exercises: [Exercise], workoutRoutine: WorkoutRoutine) {
        _workoutRoutine = State(initialValue: workoutRoutine)
        _exercises = State(initialValue: exercises)
        _workoutTitle = State(initialValue: workoutRoutine.title ?? "")
        _exercises = State(initialValue: workoutRoutine.exercises!.allObjects as! [Exercise])
    }
    
    
    
    var body: some View {
        Form {
            Section(header: Text("Name of my Workout")){
                TextField("Workout Name", text: $workoutTitle)
            }
            
            Section(header: Text("Add to my Exercise")){
                ForEach(exercises) { exercise in
                    ExerciseCell(exercise: exercise)
                    
                }
                
            }
            
//            Section() {
//                // NO Need for a Save Button
//                Button("Save", action: saveAction)
//                    .font(.headline)
//                    .frame(maxWidth: .infinity, alignment: .center)
//            }
//        }
//    }
//
//    func saveAction() {
//        withAnimation {
//            if exercises == nil {
//                exercises = Exercise(context: viewContext)
//            }
//            exercises?.title = title
//            exercises?.desc = desc
//            exercises?.reps = Int64(reps)
//            exercises?.sets = Int64(sets)
//            exercises?.timer = Int64(timer)
        }
    }


struct EditWorkoutRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        EditWorkoutRoutineView(exercises: Exercise(), workoutRoutine: WorkoutRoutine())
    }
}
    }

