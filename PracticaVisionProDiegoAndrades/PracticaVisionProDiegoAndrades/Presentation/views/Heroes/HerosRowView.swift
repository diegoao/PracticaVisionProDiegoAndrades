//
//  HerosRowView.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 1/5/24.
//

import SwiftUI
import MarvelLibrary

struct HerosRowView: View {
    var hero: Result
    @State private var text: String = ""

    var body: some View {

            ZStack(alignment: .topLeading ){
                
                Rectangle()
                    .fill(MarvelAppColor().TerciaryColor.opacity(0.6))
                    .frame(width: 362, height: 480)
                    .cornerRadius(30)
                    .id(0)
                
                
                VStack{
                    VStack{
                        ZStack{
                            Rectangle()
                                .fill(MarvelAppColor().TerciaryColor.opacity(0.8))
                                .frame(width:350, height: 35)
                                .cornerRadius(30)
                            Text("\(hero.name)")
                                .font(MarvelApFonts().textM)
                                .foregroundStyle(MarvelAppColor().TextColor4)
                                .id(1)
                        }
                    }
                    
                    VStack{
                        
                        AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension.rawValue)" )) { photo in
                            photo
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height:  300)
                                .cornerRadius(10)
                                .padding([.leading, . trailing], 32)
                                .opacity(0.8)
                                .id(2)
                            
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height:  300)
                                .cornerRadius(10)
                                .padding([.leading, . trailing], 32)
                                .opacity(1)
                                .id(3)
                        }
                    
                    }
                    VStack{
                        ScrollView {
                            VStack{
                                TextEditor(text: $text)
                                    .padding()
                                    .foregroundColor(MarvelAppColor().TextColor4)
                                    .frame(maxWidth: 358, maxHeight: .infinity) // Usamos .infinity para permitir que el TextEditor crezca verticalmente
                                    .frame(height: 110) // Ajusta el número de líneas que quieres mostrar
                                    .scrollContentBackground(.hidden)
                                    .id(4)
                                
                            }
                            .background(Color.clear)
                            .id(5)
                        }
                        Spacer()
                        
                    }

                    
                }
                .padding(.top, 20)
                .onAppear {
                    if hero.description.isEmpty{
                        text = NSLocalizedString("notdescription", comment: "")
                    }else {
                        text = hero.description // Asignamos hero.description a text cuando la vista aparece
                    }
                }
            }
        }
}

#Preview {
    HerosRowView(hero:
                    Result(
                        id: 1,
                        name: "3-D Man",
                        description: "SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1",
                        thumbnail: Thumbnail(
                            path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                            thumbnailExtension: .jpg
                        )
                        
                    )
    )
    
}
