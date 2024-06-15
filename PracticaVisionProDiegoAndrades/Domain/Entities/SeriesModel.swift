//
//  SeriesModel.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import Foundation

// MARK: - SeriesModel
struct SeriesModel: Codable {
    let data: DatoClass
}

// MARK: - DataClass
struct DatoClass: Codable {
    let results: [Resultado]
}

// MARK: - Result
struct Resultado: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let startYear, endYear: Int
    let thumbnail: Thumbnail1

}

// MARK: - Thumbnail1
struct Thumbnail1: Codable {
    let path: String
    let thumbnailExtension: Extension1

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension1: String, Codable {
    case jpg = "jpg"
}


    
