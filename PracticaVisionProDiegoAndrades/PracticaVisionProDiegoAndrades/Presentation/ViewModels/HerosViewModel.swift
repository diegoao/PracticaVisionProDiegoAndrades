//
//  HerosViewModel.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation

final class HerosViewModel: ObservableObject{
    @Published var heros: [HerosModel]?
    private var network: HeroUseCaseProtocol
    
    init(network: HeroUseCaseProtocol = HeroUseCase()) {
        self.network = network
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
    
}
