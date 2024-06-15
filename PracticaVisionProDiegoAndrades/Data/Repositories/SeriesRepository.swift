//
//  SeriesRepository.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import Foundation

// Caso Real
final class SeriesRepository: SeriesRepositoryProtocol {
    private var Network: NetworkSeriesProtocol
    
    init(network: NetworkSeriesProtocol = NetworkSeries()){
        Network = network
    }
    
    func getSeries(filter: Int) async -> [SeriesModel] {
        return await Network.getSeries(filter: filter)
    }
}


 // Caso Fake
final class SeriesRepositoryFake: SeriesRepositoryProtocol {
    private var Network: NetworkSeriesProtocol
    
    init(network: NetworkSeriesProtocol = NetworkSeriesFake()){
        Network = network
    }
    
    func getSeries(filter: Int) async -> [SeriesModel] {
        return await Network.getSeries(filter: filter)
    }
}
