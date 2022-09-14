//
//  myGymBuddyApp.swift
//  myGymBuddy
//
//  Created by Jeremy Jackman on 6/29/22.
//

import SwiftUI

@main
struct myGymBuddyApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            FirstLaunchView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
