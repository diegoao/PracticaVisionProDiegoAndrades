//
//  HerosRepositoryProtocol.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation

protocol HerosRepositoryProtocol {
    
    func getHeros() async -> [HerosModel]
}
