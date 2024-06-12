//
//  PracticaVisionProDiegoAndradesTests.swift
//  PracticaVisionProDiegoAndradesTests
//
//  Created by Macbook Pro on 12/6/24.
//

import XCTest
@testable import PracticaVisionProDiegoAndrades
import SwiftUI
import MarvelLibrary

//MARK: - Creamos testing de la app
final class IOS_SwiftUI_DiegoAndradesTests: XCTestCase{
    
    //MARK: - Testing de Heros
    
    //Compruebo que haya héroes en el HeroUseCaseFake
    func testHeroViewModel() async throws {
        let vm = HerosViewModel(network: HeroUseCaseFake())
        XCTAssertNotNil(vm)
        
    }
    
    func testHeroUseCase() async throws {
        //Compruebo que no me devuelva nil
        let usecase = HeroUseCase(repo: HerosRepositoryFake())
        XCTAssertNotNil(usecase)
        
        //Compruebo que tenga dos heroes el repositorio fake
        let data = await usecase.getHeros()
        XCTAssertEqual(data.first?.data.results.count,2)
    }
    
    // test capa domain
    func testHeros_Domain() async throws {
        let model = HerosModel(data: DataClass(results: [Result(id: 1, name: "Diego", description: "Estudiante bootcamp", thumbnail: Thumbnail(path: "http.developers.marvel.com", thumbnailExtension: .jpg))]))
        
        XCTAssertNotNil(model)
        XCTAssertEqual(model.data.results.first?.id, 1)
        XCTAssertEqual(model.data.results.first?.name, "Diego")
        XCTAssertEqual(model.data.results.first?.description, "Estudiante bootcamp")
        XCTAssertEqual(model.data.results.first?.thumbnail.path, "http.developers.marvel.com")
        XCTAssertEqual(model.data.results.first?.thumbnail.thumbnailExtension, .jpg)
        
    }
    
    //   test presentation
    func testHeros_Presentation() async throws {
        let viewModel = HerosViewModel(network: HeroUseCaseFake())
        XCTAssertNotNil(viewModel)
        
        let view = HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
        XCTAssertNotNil(view)
    }
    
    //test capa heroes depository
    func testHeros_Data() async throws {
        let network = NetworkHerosFake()
        XCTAssertNotNil(network)
        
        let repo = HerosRepository(network: network)
        XCTAssertNotNil(repo)
        
        let repo2 = HerosRepositoryFake()
        XCTAssertNotNil(repo2)
        
        
        let data = await repo.getHeros()
        XCTAssertNotNil(data)
        XCTAssertEqual(data.first?.data.results.count, 2)
        
        let data2 = await repo2.getHeros()
        XCTAssertNotNil(data2)
        XCTAssertEqual(data2.first?.data.results.count, 2)
        
        
    }
    
    
    
    //MARK: - Testing de series
    
    //Compruebo que haya Series en el HeroUseCaseFake
    func testSerieViewModel() async throws {
        let vm = SeriesViewModel(network: SeriesUseCaseFake(), id: 1)
        XCTAssertNotNil(vm)
    }
    
    func testSerieUseCase() async throws {
        //Compruebo que no me devuelva nil
        let usecase = SeriesUseCase(repo: SeriesRepositoryFake())
        XCTAssertNotNil(usecase)
        
        //Compruebo que tenga dos series el repositorio fake
        let data = await usecase.getSeries(filter: 1)
        XCTAssertEqual(data.first?.data.results.count,2)
    }
    
    // test capa domain
    func testSeries_Domain() async throws {
        let serie = SeriesModel(data: DatoClass(results: [
            Resultado(id: 2983,
                      title: "Incredible Hulk Annual (1976 - 1994)",
                      description: "Is he a man, monster or both? It's the Incredible Hulk, born of a gamma blast that scientist Bruce Banner was caught in.",
                      startYear: 1976,
                      endYear: 1994,
                      thumbnail: Thumbnail1(
                        path: "http://i.annihil.us/u/prod/marvel/i/mg/d/10/59ced640eaf88",
                        thumbnailExtension: .jpg))]))
        
        XCTAssertNotNil(serie)
        XCTAssertEqual(serie.data.results.first?.id, 2983)
        XCTAssertEqual(serie.data.results.first?.title, "Incredible Hulk Annual (1976 - 1994)")
        XCTAssertEqual(serie.data.results.first?.description, "Is he a man, monster or both? It's the Incredible Hulk, born of a gamma blast that scientist Bruce Banner was caught in.")
        XCTAssertEqual(serie.data.results.first?.startYear, 1976)
        XCTAssertEqual(serie.data.results.first?.endYear, 1994)
        XCTAssertEqual(serie.data.results.first?.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/d/10/59ced640eaf88")
        XCTAssertEqual(serie.data.results.first?.thumbnail.thumbnailExtension, .jpg)
        
    }
    
    //   test presentation
    func testSeries_Presentation() async throws {
 
        let viewModel = SeriesViewModel(network: SeriesUseCaseFake(), id: 1)
        XCTAssertNotNil(viewModel)
        
        
        let view = HeroDetailView(viewModel: SeriesViewModel(network:  SeriesUseCaseFake(), id: 2))
        XCTAssertNotNil(view)
    }
    
    //test capa heroes depository
    func testSeries_Data() async throws {
        let network = NetworkSeriesFake()
        XCTAssertNotNil(network)
        
        let repo = SeriesRepository(network: network)
        XCTAssertNotNil(repo)
        
        let repo2 = SeriesRepositoryFake()
        XCTAssertNotNil(repo2)
        
        
        let data = await repo.getSeries(filter: 1)
        XCTAssertNotNil(data)
        XCTAssertEqual(data.first?.data.results.count, 2)
        
        let data2 = await repo2.getSeries(filter: 1 )
        XCTAssertNotNil(data2)
        XCTAssertEqual(data2.first?.data.results.count, 2)
        
        
    }
    
}
