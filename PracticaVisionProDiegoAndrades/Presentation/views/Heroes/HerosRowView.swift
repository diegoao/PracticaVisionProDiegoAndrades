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
            VStack{
                VStack{
                    ZStack{
                        if hero.name.count > 13{
                            Rectangle()
                                .fill(MarvelAppColor().TextColor2.opacity(0.8))
                                .frame(width:250, height: 70)
                                .cornerRadius(30)
                        }else{
                            Rectangle()
                                .fill(MarvelAppColor().TextColor2.opacity(0.8))
                                .frame(width:250, height: 35)
                                .cornerRadius(30)
                        }
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
                            .frame(width: 200, height:  200)
                            .cornerRadius(180)
                            .padding([.leading, . trailing], 32)
                            .opacity(0.8)
                        
                            .id(2)
                        
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height:  200)
                            .cornerRadius(180)
                            .padding([.leading, . trailing], 32)
                            .opacity(1)
                            .id(3)
                    }
                }
                .padding(.top, 20)
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
