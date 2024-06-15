//
//  HerosModel.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import Foundation

// MARK: - HeroModel
import Foundation

// MARK: - HerosModel
struct HerosModel: Codable, Hashable{
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable, Hashable{
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable, Hashable {
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail

}

// MARK: - Thumbnail
struct Thumbnail: Codable, Hashable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}
