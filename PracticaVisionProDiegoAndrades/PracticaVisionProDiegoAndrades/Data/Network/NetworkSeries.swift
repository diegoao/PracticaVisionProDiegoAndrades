//
//  NetworkSeries.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 2/5/24.
//

import Foundation

protocol NetworkSeriesProtocol {
    func getSeries(filter: Int) async -> [SeriesModel]
}


final class NetworkSeries: NetworkSeriesProtocol {
    func getSeries(filter: Int) async -> [SeriesModel] {
        var modelReturn = [SeriesModel]()
        let id = String("/\(filter)")
        let urlCad = "\(ConstantsApp.URL_API)\(Endpoints.characters.rawValue)\(id)\(Endpoints.series.rawValue)\(ConstantsApp.TS)\(ConstantsApp.APIKEY)\(ConstantsApp.HASH)"
        var request = URLRequest(url: URL(string:urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        

        //Llamamos al servidor

        do{
            let(data, response)  = try await URLSession.shared.data(for: request)
            if let resp = response as? HTTPURLResponse{
                if resp.statusCode == HTTPResponseCodes.SUCESS{
                    
                    modelReturn.append(try! JSONDecoder().decode(SeriesModel.self, from: data))
                    
                }
            }
        }catch{
            print("error peticion")
        }
        return modelReturn
    }
}

///Clase fake de series para pruebas y test
public final class NetworkSeriesFake: NetworkSeriesProtocol {
    public init(){}
    func getSeries(filter: Int) async -> [SeriesModel] {
        let series = SeriesModel(data: DatoClass(
            results: [
                Resultado(id: 2983,
                          title: "Incredible Hulk Annual (1976 - 1994)",
                          description: "Is he a man, monster or both? It's the Incredible Hulk, born of a gamma blast that scientist Bruce Banner was caught in.",
                          startYear: 1976,
                          endYear: 1994,
                          thumbnail: Thumbnail1(
                            path: "http://i.annihil.us/u/prod/marvel/i/mg/d/10/59ced640eaf88",
                            thumbnailExtension: .jpg)),
                
                Resultado(id: 2121,
                          title: "Fantastic Four (1961 - 1998)",
                          description: "Witness the comic masterpiece that gave birth to the Marvel Age! Mister Fantastic, The Thing, The Human Torch and The Invisible Girl unite to uncover the universe's greatest mysteries and face down would be world-conquerors like Doctor Doom, the Skrulls, Galactus and countless others!",
                          startYear: 1961,
                          endYear: 1998,
                          thumbnail: Thumbnail1(
                            path: "http://i.annihil.us/u/prod/marvel/i/mg/8/b0/5b3a640a930fb",
                            thumbnailExtension: .jpg)),
            ]
        )
    )
    return [series]
    }
}
