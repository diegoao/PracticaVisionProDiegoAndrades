//
//  HerosRepositoryProtocol.swift
//  PracticaVisionProDiegoAndrades
//
//  Created by Macbook Pro on 15/6/24.
//

import Foundation

protocol HerosRepositoryProtocol {
    
    func getHeros() async -> [HerosModel]
}
