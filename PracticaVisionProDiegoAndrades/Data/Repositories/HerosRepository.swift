//
//  HerosRepository.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import Foundation

// Caso Real
final class HerosRepository: HerosRepositoryProtocol {
    private var Network: NetworkHerosProtocol
    
    init(network: NetworkHerosProtocol = NetworkHeros()){
        Network = network
    }
    
    func getHeros() async -> [HerosModel] {
        return await Network.getHeros()
    }
}


 // Caso Fake
final class HerosRepositoryFake: HerosRepositoryProtocol {
    private var Network: NetworkHerosProtocol
    
    init(network: NetworkHerosProtocol = NetworkHerosFake()){
        Network = network
    }
    
    func getHeros() async -> [HerosModel] {
        return await Network.getHeros()
    }
}
