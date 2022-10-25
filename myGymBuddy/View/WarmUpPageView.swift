//
//  WarmUpPageView.swift
//  myGymBuddy
//
//  Created by Jeremy Jackman on 8/25/22.
//

import SwiftUI

struct WarmUpPageView: View {
    var body: some View {
        List {
            Section(header: Text("Warm Ups")) {
                Text("Stretch")
                Text("Planks for 1 Min")
                Text("Keep ❤️ above 150 for 1 Min while 🏃")
                Text("Keep ❤️ between 110 - 125 for 4 Min while 🏃")
                Text("Repeat 2 to 4 times before any Workout")
            }
        }
        .navigationTitle("Warm up Page")
    }
}

struct WarmUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        WarmUpPageView()
    }
}
