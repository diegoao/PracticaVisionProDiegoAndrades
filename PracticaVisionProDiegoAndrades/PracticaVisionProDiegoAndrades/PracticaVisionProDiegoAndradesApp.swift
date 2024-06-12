//
//  PracticaVisionProDiegoAndradesApp.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 12/6/24.
//

import SwiftUI

@main
struct PracticaVisionProDiegoAndradesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
