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
                //año inicio y fin
                Text("\(serie.startYear)-\(serie.endYear)")
                    .font(MarvelApFonts().textXS)
                    .foregroundStyle(MarvelAppColor().TextColor1)
                    .id(0)
            }
            VStack{
                //Foto
                AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension.rawValue)" )) { photo in
                    photo
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(40)
                        .padding()
                        .id(1)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(40)
                        .padding()
                        .id(2)
                }
            }
            VStack{
                //Titulo
                Text(serie.title)
                    .font(MarvelApFonts().textXS)
                    .foregroundStyle(MarvelAppColor().TextColor1)
                    .id(3)
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
