//
//  PracticaVisionProDiegoAndradesApp.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 12/6/24.
//


import SwiftUI
import TipKit

@main
struct IOS_SwiftUI_DiegoAndradesApp: App {
    

    /// Instanciamos el viewModelGlobal
    let appState = AppState() //viewModelGlobal

    var body: some Scene {
        WindowGroup {
            ViewRouter()
                .environmentObject(appState)
        }
        .windowStyle(.plain) //Indicamos que es una ventana normal
        
    }
}
