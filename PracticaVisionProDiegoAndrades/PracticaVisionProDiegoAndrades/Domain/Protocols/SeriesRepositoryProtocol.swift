//
//  SeriesRepositoryProtocol.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 2/5/24.
//

import Foundation

protocol SeriesRepositoryProtocol {
    
    func getSeries(filter: Int) async -> [SeriesModel]
}
