//
//  HeroesViewV01.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 13/6/24.
//

import SwiftUI
import MarvelLibrary

struct HeroesViewV01: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: HerosViewModel
    
    var body: some View {
        
        ZStack {
            VStack{
                TabView{
                    Text("Heroes")
                        .tabItem {
                            Label(
                                title: { Text("Marvel Heroes") },
                                icon: { Image(systemName: "house.fill") }
                            )
                        }
                   
                }
            }
        }
 
    }
}


#Preview {
    HeroesViewV01(viewModel: HerosViewModel(network: HeroUseCaseFake()))
        .environmentObject(AppState())
  
}


