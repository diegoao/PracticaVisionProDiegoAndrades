//
//  HeroesViewv02.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 13/6/24.
//

import SwiftUI
import MarvelLibrary

struct HeroesViewV02: View {
    
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
            VStack{
                if let hero = selectedHero{
                    NavigationStack{
                        VStack{
                            //fot
                            Text(String(hero.data.results.first?.name ?? "iron"))
//                            AsyncImage(url: URL(string: "\(String(describing: hero.data.results.first?.thumbnail.path)). \(String(describing: hero.data.results.first?.thumbnail.thumbnailExtension))"))
                        
                            //descripción
    
                        }
                    }
                } else{
                    //Vista por defecto
                    ContentUnavailableView("Elige un Héroe", systemImage: "person.fill", description: Text("Para cargar información haga click en el listado de la izquierda"))
                    
                    
                }
                
            }
            .navigationTitle("Detalles del héroe")
            
            
        } detail: {
            //Series del Héroe
        }

        .onAppear {
            print("Selected Hero: \(selectedHero?.data.results.first?.name ?? "None")")
        }
        
    }
      
}
#Preview {
    HeroesViewV02(viewModel: HerosViewModel(network: HeroUseCaseFake()))
        .environmentObject(AppState())
  
}
