//
//  HerosViewModel.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation

final class HerosViewModel: ObservableObject{
    @Published var heros: [HerosModel]?
    @Published var serie: [Resultado]?
    private var network: HeroUseCaseProtocol
    private var networkSeries: SeriesUseCaseProtocol
    private var id: Int 
    
    init(network: HeroUseCaseProtocol = HeroUseCase(), networkSeries: SeriesUseCaseProtocol = SeriesUseCase(), id: Int = 0) {
        self.network = network
        self.networkSeries = networkSeries
        self.id = id
        
        //lanzamos la carga
        getHeros()
    }
    
    ///Función para cargar la lista de héroes al llamar a la vista
    func getHeros() {
        Task{
            let data = await network.getHeros()
            DispatchQueue.main.async {
                 self.heros = data   
            }
        }
    }
    
    ///Función para cargar la lista de series cuando hacemos tap en un héroe
    func getSeries(id: Int) {
        Task{
            let data = await networkSeries.getSeries(filter: id )
            DispatchQueue.main.async {
                self.serie = data.first?.data.results
            }
        }
    }
    
}
