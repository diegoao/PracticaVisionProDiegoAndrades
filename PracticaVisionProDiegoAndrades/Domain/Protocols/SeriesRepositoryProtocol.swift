//
//  SeriesRepositoryProtocol.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import Foundation

protocol SeriesRepositoryProtocol {
    
    func getSeries(filter: Int) async -> [SeriesModel]
}
