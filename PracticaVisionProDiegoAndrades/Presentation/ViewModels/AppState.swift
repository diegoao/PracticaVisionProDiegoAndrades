//
//  AppState.swift
//  IOS-SwiftUI.DiegoAndrades
//
//  Created by Macbook Pro on 29/4/24.
//

import Foundation



enum AppStatus {
    case heroes
}


final class AppState: ObservableObject{
    @Published var status = AppStatus.heroes
    private var network : NetworkHerosProtocol
    private var networkSeries : NetworkSeriesProtocol
    
    init(network: NetworkHerosProtocol = NetworkHeros(), networkSeries: NetworkSeriesProtocol = NetworkSeries()){
        self.network = network
        self.networkSeries = networkSeries
    }
    
    func goSeries(id: Int){
        Task{
            let series = await networkSeries.getSeries(filter: id)
            DispatchQueue.main.async {
                if !series.isEmpty {
                    print("Se han cargado las series")
                }else{
                    print("No se han cargado datos")
                }
            }
        }
    }
    
    func goheros(){
        Task{
            DispatchQueue.main.async {
                self.status = .heroes
                }
            }
        }
    }

