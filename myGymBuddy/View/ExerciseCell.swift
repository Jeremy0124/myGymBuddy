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
    
    var body: some View {
        TextField("Exercise Name", text: $exercise.title ?? "")
        TextField("Exercise Description", text: $exercise.desc ?? "")
        TextField("How many Reps?", value: $exercise.reps ,format: .number)
            .textFieldStyle(.roundedBorder)
        TextField("How many Sets?", value: $exercise.sets ,format: .number)
            .textFieldStyle(.roundedBorder)
        TextField("Timer", value: $exercise.timer ,format: .number)
            .textFieldStyle(.roundedBorder)
    }
}

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCell(exercise: Exercise())
    }
}
