//
//  HeroUseCase.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation


protocol HeroUseCaseProtocol {
    var repo: HerosRepositoryProtocol {get set}
    func getHeros() async -> [HerosModel]
}


//Real
final class HeroUseCase: HeroUseCaseProtocol{
    var repo: HerosRepositoryProtocol
    init(repo: HerosRepositoryProtocol = HerosRepository(network: NetworkHeros())){
        self.repo = repo
    }
    
    func getHeros() async -> [HerosModel] {
        await repo.getHeros()
    }
}

//Fake
final class HeroUseCaseFake: HeroUseCaseProtocol{
    var repo: HerosRepositoryProtocol
    init(repo: HerosRepositoryProtocol = HerosRepository(network: NetworkHerosFake())){
        self.repo = repo
    }
    
    func getHeros() async -> [HerosModel] {
        await repo.getHeros()
    }
}
