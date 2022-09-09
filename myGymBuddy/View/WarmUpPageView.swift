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
                Text("Stretch Back")
                Text("Planks")
                Text("Stretch Arm")
                Text("Stretch Legs")
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
