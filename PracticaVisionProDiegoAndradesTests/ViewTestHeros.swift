//
//  ViewTestHeros.swift
//  PracticaVisionProDiegoAndradesTests
//
//  Created by Macbook Pro on 16/6/24.
//

import XCTest
import SwiftUI
import MarvelLibrary
import ViewInspector

@testable import PracticaVisionProDiegoAndrades

extension HeroesView: Inspectable{}
extension HerosRowView: Inspectable{}
extension SeriesRowView: Inspectable{}


final class ViewTestHeros: XCTestCase {
    
    /// Test  heroView
    func testViewHeroes() throws {
        //instaciamos la vista
        let view = HeroesView(viewModel: HerosViewModel(network: HeroUseCaseFake()))
            .environmentObject(AppState())
            
        XCTAssertNotNil(view)
        
        //Comprobamos que haya un items creado
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        // Compruebo que está el titulo de la lista
        let titleList = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(titleList)
        
        // Titulo por defecto
        let titledefault = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(titledefault)
        
        
        // Lista de series de un heroe
        let listSeries = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(listSeries)
        
        // Mensaje por defectoseries de un heroe
        let listSeriesDefault = try view.inspect().find(viewWithId: 4)
        XCTAssertNotNil(listSeriesDefault)

        
    }
    
    /// Test HerosRowView
    func testViewHerosRowView() throws {
        let view = HerosRowView(hero:
                                        Result(
                                            id: 1,
                                            name: "3-D Man",
                                            description: "SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1SuperHeroe fake 1",
                                            thumbnail: Thumbnail(
                                                path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                                                thumbnailExtension: .jpg
                                            )))
        
        XCTAssertNotNil(view)
        
        //Comprobamos que haya un items creado
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        // Compruebo que está el rectangulo de fondo
        let rectangle = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(rectangle)
        
        // Compruebo que está el campo de texto del nombre del personaje
        let textName = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(textName)
        
        // Se comprueba que está la view de la imagen del heroe
        let photoHero = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(photoHero)
        
        // Se comprueba que está la view de la imagen del heroe si hay un error en la carga
        let photoHeroError = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(photoHeroError)
        
        
    }
    
    /// Test SeriesRowView
    func testSeriesRowView() throws {
        let view =  SeriesRowView(serie: Resultado(
            id: 23058,
            title: "All-New Guardians of the Galaxy (2017)",
            description: "",
            startYear: 2017,
            endYear: 2017,
            thumbnail: Thumbnail1(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/10/5d92452f1ab25",
                                  thumbnailExtension: .jpg)))
        
        
        XCTAssertNotNil(view)
        
       
        
        // Compruebo que está el campo de texto con el titulo de la serie
        let textName = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(textName)
        
        // Se comprueba que está la view de la imagen del heroe
        let photoHero = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(photoHero)
        
        // Se comprueba que está la view de la imagen del heroe si hay un error en la carga
        let photoHeroError = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(photoHeroError)
        
        // Compruebo que está el campo de texto con el las fechas de la serie
        let textDate = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(textDate)
            
    
    }
    
}
