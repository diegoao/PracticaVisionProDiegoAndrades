//
//  HerosRepository.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
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
