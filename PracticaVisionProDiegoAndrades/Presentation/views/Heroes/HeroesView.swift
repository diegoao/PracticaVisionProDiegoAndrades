//
//  HeroesViewv02.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 13/6/24.
//

import SwiftUI
import MarvelLibrary

struct HeroesView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: HerosViewModel
    
    @State private var selectedHero: HerosModel?
    
    var body: some View {
        NavigationSplitView {
            //Lista de Héroes
            List(selection: $selectedHero){
                if let heros = viewModel.heros?.first?.data.results {
                    ForEach(heros){ hero in
                        NavigationLink(value: hero){
                            HerosRowView(hero: hero)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.white.opacity(0)) // Elimino el color de fondo de la lista
                        }.tag(hero)
                    }
                }
            }
            .navigationTitle("Lista de Héroes")
            
        } content: {

            //Detalle del Hero
            VStack{
                if let hero = selectedHero {
                    NavigationStack{
                        VStack{
                            //Foto
//                            AsyncImage(url: URL(string: hero.data.results.first..photo))
                            //description del hero
                            Text(hero.data.results.first?.description ?? "pruebaDescri")
                        }
                    }
                    .navigationTitle(hero.data.results.first?.name ?? "PruebaTitulo")
                } else {
                    //Vista sin contenido
                    ContentUnavailableView("Selecciona un heroe", systemImage: "person.fill")
                }
            }
            
        } detail: {
            //Series del Héroe
            
            
        }
        
    }
      
}
#Preview {
    HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
        .environmentObject(AppState())
  
}
