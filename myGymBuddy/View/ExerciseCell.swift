//
//  ExerciseCell.swift
//  +
//
//  Created by Jeremy Jackman on 9/6/22.
//

import SwiftUI

struct ExerciseCell: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var exercise: Exercise
    var isEditing: Bool = false
    var isComplete: Bool = false
    
    var body: some View {
        VStack {
            Text("ExerciseCell")
            TextField("Exercise Name", text: $exercise.title ?? "")
            
            TextField("Exercise Description", text: $exercise.desc ?? "")
            
            HStack{
                Text("\(exercise.reps) Reps for each Set")
                Spacer()
                if isEditing {
                    HStack {
                        HStack {
                            Button(action: {self.exercise.reps = exercise.reps - 1}) {
                                Text("-")
                            }
                            .buttonStyle(BorderedButtonStyle())
                            HStack {
                                Button(action: {self.exercise.reps = exercise.reps + 1}) {
                                    Text("+")
                                }
                                .buttonStyle(BorderedButtonStyle())
                            }
                            .padding(.trailing)
                        }
                    }
                }
            }
            
            HStack{
                Text("\(exercise.sets) Sets")
                Spacer()
                if isEditing {
                    HStack {
                        HStack {
                            Button(action: {self.exercise.sets = exercise.sets - 1}) {
                                Text("-")
                            }
                            .buttonStyle(BorderedButtonStyle())
                            HStack {
                                Button(action: {self.exercise.sets = exercise.sets + 1}) {
                                    Text("+")
                                }
                                .buttonStyle(BorderedButtonStyle())
                            }
                            .padding(.trailing)
                        }
                    }
                }
            }
            
            HStack{
                Text("\(exercise.weight) lbs")
                Spacer()
                if isEditing {
                    HStack {
                        HStack {
                            Button(action: {self.exercise.weight = exercise.weight - 5}) {
                                Text("-")
                            }
                            .buttonStyle(BorderedButtonStyle())
                            HStack {
                                Button(action: {self.exercise.weight = exercise.weight + 5}) {
                                    Text("+")
                                }
                                .buttonStyle(BorderedButtonStyle())
                            }
                            .padding(.trailing)
                        }
                    }
                }
            }
            
            if exercise.isComplete {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 20))
                }
            }
            
        }
    }
}

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCell(exercise: Exercise.example)
            .previewLayout(.sizeThatFits)
    }
}
