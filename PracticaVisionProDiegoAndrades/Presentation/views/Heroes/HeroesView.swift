//
//  HeroesViewv.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import MarvelLibrary

struct HeroesView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: HerosViewModel

    
    
    @State private var selectedHero: Result?
    
    var body: some View {
        ZStack{
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
                                        .frame(minHeight: 300, maxHeight: 400)
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
                        ContentUnavailableView("Selecciona un heroe", systemImage: "person.fill", description: Text("Seleccione un héroe haciendo Tap para cargar sus detalles"))
                    }
                }
                
            } detail: {
                // Series del Héroe
                NavigationStack {
                    if let hero = selectedHero {
                        VStack {
                            if let dato = viewModel.serie {
                                if !dato.isEmpty {
                                    List(){
                                        ForEach(dato) { series in
                                            SeriesRowView(serie: series)
                                                .frame(maxWidth: .infinity, alignment: .center) // Centra el contenido
                                        }
                                        .id(8)
                                        
                                    }
                                }else{
                                    ContentUnavailableView("No hay series para este personaje", systemImage: "xmark.icloud.fill")
                                }
                                
                            } else {
                                Text("notseries")
                                    .id(9)
                            }
                        }
                        .onChange(of: hero, { oldValue, newValue in
                            viewModel.getSeries(id: newValue.id)
                        })
                        .onAppear{
                            viewModel.getSeries(id: hero.id)
                        }
                        
                    } else {
                        ContentUnavailableView("Sin Datos", systemImage: "xmark.icloud.fill")
                    }
                }
                .navigationTitle("Listado de Series")
            }
            // ------------------------------
            // Reality Kit para cargar sonido
            // ------------------------------
            RealityView{ content in
                if let scene = try? await Entity(named: "Hero", in:  realityKitContentBundle){
                    
                    //Busco el Emisor de sonido
                    guard let SoundEmitter =  scene.findEntity(named: "SoundEmitter") else {
                        NSLog("Emitter no encontrado en la vista HeroesView")
                        return
                    }
                    
                    //Busco el audio
                    guard let recourceSound = try? await AudioFileResource(named: "/Root/introMarvel_wav", from: "Hero.usda", in: realityKitContentBundle) else {
                        NSLog("No se encuentra Sonido")
                        return
                    }
                    
                    //Asocio al emisor de Sonido el audio
                    let audio = SoundEmitter.prepareAudio(recourceSound)
                    audio.play()
                    
                    //Añado la escena a Content
                    content.add(scene)

                }
            }
        }
    }
}



#Preview {
    HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
        .environmentObject(AppState())
  
}


