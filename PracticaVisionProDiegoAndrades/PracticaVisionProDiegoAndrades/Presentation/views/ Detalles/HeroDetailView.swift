//
//  HeroDetailView.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 1/5/24.
//

import SwiftUI
import MarvelLibrary

struct HeroDetailView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SeriesViewModel
    var heroe: Result? // Variable de estado para almacenar el héroe seleccionado
    @State private var text: String = ""
    
    
    var body: some View {
        if let hero = heroe{
            
           
            VStack(alignment: .center) {
                ZStack{
                    Rectangle()
                        .fill(MarvelAppColor().SecundaryColor.opacity(0.8))
                        .frame(width:358, height: 35)
                        .cornerRadius(10)
                        .id(0)
                    HStack{
                        Button(action: {
                            appState.goheros()
                        }, label: {
                            Image(systemName: "chevron.backward.square.fill")
                                .font(.system(size: 30))
                            Text("back")
                        })
                        .id(1)
                        
                        Text("title2").font(MarvelApFonts().textS)
                            .foregroundStyle(MarvelAppColor().TextColor3)
                            .id(2)
                    }
                }
                
                VStack{
                    DetailRowView(hero: hero)
                        .id(3)
                }
                
                .onAppear {
                    if hero.description.isEmpty{
                        text = NSLocalizedString("notdescription", comment: "")
                    }else {
                        text = hero.description // Asignamos hero.description a text cuando la vista aparece
                    }
                }
                
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(MarvelAppColor().primaryColor.opacity(0.8))
                            .frame(width:358, height: 35)
                            .cornerRadius(10)
                            .id(4)
                        Text("Description").font(MarvelApFonts().textXS)
                            .foregroundStyle(MarvelAppColor().TextColor4)
                            .id(5)
                    }
                }
                
                VStack{
                    ScrollView {
                        VStack{
                            TextEditor(text: $text)
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: 358, maxHeight: .infinity) // Usamos .infinity para permitir que el TextEditor crezca verticalmente
                                .frame(height: 110) // Ajusta el número de líneas que quieres mostrar
                                .scrollContentBackground(.hidden)
                                .id(6)
                        }
                        .background(Color.clear)
                        .id(7)
                    }
                    Spacer()
                }
                
                VStack{
                    if let dato = viewModel.serie{
                        ScrollView(.horizontal){
                            LazyHStack{
                                ForEach(dato){ series in
                                    
                                    NetflixScrollView(serie: series)

                                }
                            }
                            .id(8)
                            .frame(height: 170)
                        }
                        
                    }else{
                        Text("notseries")
                            .id(9)
                    }
                }
                Spacer()
            }
            
            .background(
                Image("fondo2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)
                    .id(10))
            .background(Color.gray.opacity(0.5))
            
        }
    }
}

// Vista de previsualización
#Preview {
    HeroDetailView(viewModel: SeriesViewModel(id:1), heroe: Result(
        id: 2,
        name: "A.I.M.",
        description: "AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.AIM is a terrorist organization bent on destroying the world.",
        thumbnail: Thumbnail(
            path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
            thumbnailExtension: .jpg)))
        .environmentObject(AppState())
}
