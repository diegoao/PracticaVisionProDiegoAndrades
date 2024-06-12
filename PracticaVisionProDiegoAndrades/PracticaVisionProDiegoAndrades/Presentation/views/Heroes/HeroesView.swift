//
//  HeroesView.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import SwiftUI
import MarvelLibrary


struct HeroesView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: HerosViewModel

    var body: some View {
   

            Text("title1").font(MarvelApFonts().textXS)
                .id(0)
            NavigationStack{
                List{
                    if let heros = viewModel.heros?.first?.data.results {
                        ForEach(heros){ hero in
                            
                            HerosRowView(hero: hero)
  
                                .listRowSeparator(.hidden)
                           
                                .listRowBackground(Color.white.opacity(0)) // Elimino el color de fondo de la lista
                                .onTapGesture {
                                    appState.goDetail(id: hero.id, hero: hero)
                                }
                        }
                    }
                }
            
                .listStyle(PlainListStyle())
                .id(1)
                .background(
                    Image("fondo1")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.8)
                        .id(2))
                        
                        
                .background(Color.black.opacity(0.5))
                
            }
        }
    }

#Preview {
    HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
        .environmentObject(AppState())
  
}
