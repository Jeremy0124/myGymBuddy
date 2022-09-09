//
//  ExerciseCell.swift
//  +
//
//  Created by Jeremy Jackman on 9/6/22.
//

import SwiftUI

struct ExerciseCell: View {
    var exercise: Exercise
    
    @State var title: String
    @State var desc: String
    @State var reps: Int = 0
    @State var sets: Int = 0
    @State var timer: Int = 0
    
    init(exercise: Exercise) {
        if let exercise = Exercise() {
            _title = State(initialValue: exercise.title ?? "")
            _desc = State(initialValue: exercise.desc ?? "")
            _reps = State(initialValue: Int(exercise.reps))
            _sets = State(initialValue: Int(exercise.sets))
            _timer = State(initialValue: Int(exercise.timer))
        } else {
            // Default Value
            _title = State(initialValue: "")
            _desc = State(initialValue: "")
            _reps = State(initialValue: 0)
            _sets = State(initialValue: 0)
            _timer = State(initialValue: 0)
            
        }
        
    }
    
    var body: some View {
        TextField("Exercise Name", text: $title)
        TextField("Exercise Description", text: $desc)
        TextField("How many Reps?", value: $reps,format: .number)
            .textFieldStyle(.roundedBorder)
        TextField("How many Sets?", value: $sets,format: .number)
            .textFieldStyle(.roundedBorder)
        TextField("Timer", value: $timer,format: .number)
            .textFieldStyle(.roundedBorder)
    }
}

struct ExerciseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCell(exercise: Exercise())
    }
}
