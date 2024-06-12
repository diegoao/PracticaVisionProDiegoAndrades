//
//  SeriesViewModel.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 2/5/24.
//

import Foundation

final class SeriesViewModel: ObservableObject{
    @Published var serie: [Resultado]?
    private var network: SeriesUseCaseProtocol
    private var id: Int = 0
    
    init(network: SeriesUseCaseProtocol = SeriesUseCase(), id: Int) {
        self.network = network
        self.id = id
        getSeries(id: id)
    }
    ///Función para cargar la lista de series cuando hacemos tap en un héroe
    func getSeries(id: Int) {
        Task{
            let data = await network.getSeries(filter: id )
            DispatchQueue.main.async {
                self.serie = data.first?.data.results
            }
        }
    }
}
