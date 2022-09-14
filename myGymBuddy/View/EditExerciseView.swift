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
    
    @State var exercise: Exercise?
    @State var exerciseTitle: String
    @State var exerciseDesc: String
    
    
    init(exercise: Exercise?) {
        if let exercise = exercise {
            _exercise = State(initialValue: exercise)
            
            _exerciseTitle = State(initialValue: exercise.title ?? "")
            _exerciseDesc = State(initialValue: exercise.desc ?? "")
            
        } else {
            //Default value
            _exerciseTitle = State(initialValue: "")
            _exerciseDesc = State(initialValue: "")
        }
    }
    var body: some View {
        Text("EditExerciseView")
        Form {
            Section(header: Text("Add to my Exercise")){
                TextField("Exercise Name", text: $exerciseTitle)
                TextField("Exercise Description", text: $exerciseDesc)
            }
            
            
            Section() {
                Button("Save", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                if let exercise = exercise {
                    Button {
                        delete(exercise: exercise)
                    } label: {
                        Text("Delete")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)

                }
            }
        }
    }
    
    func saveAction() {
        withAnimation {
            if exercise == nil {
                exercise = Exercise(context: viewContext)
            }
            exercise?.title = exerciseTitle
            exercise?.desc = exerciseDesc
            
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
