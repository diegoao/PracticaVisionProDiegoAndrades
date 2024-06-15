//
//  ViewRouter.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import SwiftUI

struct ViewRouter: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch(appState.status){
        case .heroes:
            withAnimation {
                HeroesView(viewModel: HerosViewModel())
            }
        }
    }
}

#Preview {
    ViewRouter()
        .environmentObject(AppState())
}
