//
//  EditPageView.swift
//  myGymBuddy
//
//  Created by Jeremy Jackman on 8/22/22.
//

import SwiftUI

struct EditExerciseView: View {
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var exercise: Exercise
    @State var exerciseTitle: String = ""
    @State var exerciseDesc: String = ""
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    var body: some View {
        // Text("EditExerciseView")
        Form {
            Section(header: Text("Add to my Exercise")){
                TextField("Exercise Name", text: $exerciseTitle)
                TextField("Exercise Description", text: $exerciseDesc)
            }
            .onAppear {
                exerciseTitle = exercise.title ?? ""
                exerciseDesc = exercise.desc ?? ""
            }
            Section() {
                Button("Exercise Complete", action: exerciseComplete)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.green)
                Button("Save", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.blue)
                if let exercise = exercise {
                    Button {
                        delete(exercise: exercise)
                    } label: {
                        Text("Delete")
                            .foregroundColor(.red)
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
    
    func exerciseComplete() {
        exercise.isComplete.toggle()
        presentationMode.wrappedValue.dismiss()
    }
    
    func saveAction() {
        withAnimation {
            exercise.title = exerciseTitle
            exercise.desc = exerciseDesc
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func delete(exercise: Exercise) {
        CoreDataHelper.shared.deleteExercise(exercise: exercise)
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditPageView_Previews: PreviewProvider {
    static var previews: some View {
        EditExerciseView(exercise: Exercise.example)
    }
}
