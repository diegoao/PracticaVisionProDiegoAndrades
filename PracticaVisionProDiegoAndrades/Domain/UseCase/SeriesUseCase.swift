//
//  SeriesUseCase.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import Foundation

protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol {get set}
    func getSeries(filter: Int) async -> [SeriesModel]
}

//Real
final class SeriesUseCase: SeriesUseCaseProtocol{
    var repo: SeriesRepositoryProtocol
    init(repo: SeriesRepositoryProtocol = SeriesRepository(network: NetworkSeries())){
        self.repo = repo
    }
    
    func getSeries(filter: Int) async -> [SeriesModel] {
        await repo.getSeries(filter: filter)
    }
}

//Fake
final class SeriesUseCaseFake: SeriesUseCaseProtocol{
    var repo: SeriesRepositoryProtocol
    init(repo: SeriesRepositoryProtocol = SeriesRepository(network: NetworkSeriesFake())){
        self.repo = repo
    }
    
    func getSeries(filter: Int) async -> [SeriesModel] {
        await repo.getSeries(filter: filter)
    }
}

