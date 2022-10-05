//
//  ButtonStyles.swift
//  MyGymBuddy
//
//  Created by Jeremy Jackman on 10/5/22.
//

import Foundation
import SwiftUI

struct SaveButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(Color(.green))
            .foregroundColor(Color(.white))
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
