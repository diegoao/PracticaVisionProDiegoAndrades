//
//  ViewRouter.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import SwiftUI

struct ViewRouter: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch(appState.status){
        case .heroes:
            withAnimation {
                HeroesViewV02(viewModel: HerosViewModel())
            }
            
        case .detalles(let id, let heroe):
            withAnimation {
                HeroDetailView(viewModel: SeriesViewModel(id: id), heroe: heroe)
            }
        }
     
    }
}

#Preview {
    ViewRouter()
        .environmentObject(AppState())
}
