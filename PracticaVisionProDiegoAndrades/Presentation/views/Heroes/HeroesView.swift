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
    
    @State private var selectedHero: Result?
    
    var body: some View {
        NavigationSplitView {
            //Lista de Héroes
            List(selection: $selectedHero){
                if let heros = viewModel.heros?.first?.data.results {
                    ForEach(heros){ hero in
                        NavigationLink(value: hero){
                            HerosRowView(hero: hero)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.white.opacity(0))
                        }
                        .tag(hero)
                    }
                }
            }
            .navigationTitle("Lista de Héroes")
            
        } content: {
            VStack{
                if let hero = selectedHero {
                    NavigationStack{
                        VStack{
                            //Foto
                            AsyncImage(url: URL(string: ("\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension.rawValue)"))){ foto in
                                foto
                                    .resizable()
                                    .frame(minHeight: 200, maxHeight: 400)
                                    .cornerRadius(20)
                                
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        if hero.description.count == 0 {
                            VStack{
                                //description del hero empty
                                Text("Este héroe no tiene descripción.")
                            }
                        }else{
                            VStack{
                                //description del hero
                                Text(hero.description)
                            }
                        }
                        
                        Spacer()
                    }
                    .navigationTitle(hero.name.uppercased())
                    .font(.title)
                } else {
                    //Vista sin contenido
                    ContentUnavailableView("Selecciona un heroe", systemImage: "person.fill")
                }
            }
            
        } detail: {
            //Series del Héroe
            NavigationStack{
                if let hero = selectedHero{
                    List{
                        ForEach(hero.transformations){ trans in
                            VStack{
                                AsyncImage(url: URL(string: trans.photo)) { foto in
                                    foto
                                        .resizable()
                                        .frame(minHeight: 200, maxHeight: 400)
                                        .cornerRadius(20)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                //nombre
                                Text(trans.name)
                                    .font(.title2)
                                //detalle
                                Text(trans.description)
                                    .font(.caption2)
                                
                            }
                            
                        }
                    }
                } else {
                    ContentUnavailableView("Sin Datos", systemImage: "xmark.icloud.fill")
                }
            }
            .navigationTitle("Listado de Series")
            
        }
        
    }
}
#Preview {
    HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
        .environmentObject(AppState())
  
}
