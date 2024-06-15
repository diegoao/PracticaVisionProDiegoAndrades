//
//  SeriesRowView.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import SwiftUI
import MarvelLibrary

struct SeriesRowView: View {
    var serie: Resultado
    var body: some View {
        VStack(spacing:-10){
            VStack{
              
                //Titulo
                Text(serie.title)
                    .font(MarvelApFonts().textM)
                    .foregroundStyle(MarvelAppColor().TextColor1)
                    .id(3)

            }
            VStack{
                //Foto
                AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension.rawValue)" )) { photo in
                    photo
                        .resizable()
                        .cornerRadius(40)
                        .frame(width: 300, height: 300)
                        .padding()
                        .id(1)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(40)
                        .padding()
                        .id(2)
                }
            }
            VStack{
                //año inicio y fin
                Text("\(serie.startYear)-\(serie.endYear)")
                    .font(MarvelApFonts().textM)
                    .foregroundStyle(MarvelAppColor().TextColor1)
                    .id(0)
              
            }
        }
    }
}

#Preview {
    SeriesRowView(serie: Resultado(
        id: 23058,
        title: "All-New Guardians of the Galaxy (2017)",
        description: "",
        startYear: 2017,
        endYear: 2017,
        thumbnail: Thumbnail1(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/10/5d92452f1ab25",
                              thumbnailExtension: .jpg)))
}
