//
//  NetworkHeros.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import Foundation

protocol NetworkHerosProtocol {
    func getHeros() async -> [HerosModel]
}


final class NetworkHeros: NetworkHerosProtocol {
    func getHeros() async -> [HerosModel] {
        var modelReturn = [HerosModel]()
        
        let urlCad = "\(ConstantsApp.URL_API)\(Endpoints.characters.rawValue)\(ConstantsApp.TS)\(ConstantsApp.APIKEY)\(ConstantsApp.HASH)"
        var request = URLRequest(url: URL(string:urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        

        //Llamamos al servidor

        do{
            let(data, response)  = try await URLSession.shared.data(for: request)
            if let resp = response as? HTTPURLResponse{
                if resp.statusCode == HTTPResponseCodes.SUCESS{
                    
                    modelReturn.append(try! JSONDecoder().decode(HerosModel.self, from: data))
                    
                }
            }
        }catch{
            print("error peticion")
        }
        return modelReturn
    }
}

///Clase fake de heros para pruebas y test
public final class NetworkHerosFake: NetworkHerosProtocol {
    public init(){}
    func getHeros() async -> [HerosModel] {
        let modelos = HerosModel(data: DataClass(
            results: [
                Result(
                    id: 1,
                    name: "3-D Man",
                    description: "SuperHeroe fake 1",
                    thumbnail: Thumbnail(
                        path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                        thumbnailExtension: .jpg
                    )
                    
                ),
                Result(
                    id: 2,
                    name: "A.I.M.",
                    description: "AIM is a terrorist organization bent on destroying the world.",
                    thumbnail: Thumbnail(
                        path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
                        thumbnailExtension: .jpg
                    )
                )
            ]
        )
    )
        return [modelos]
    }
}

