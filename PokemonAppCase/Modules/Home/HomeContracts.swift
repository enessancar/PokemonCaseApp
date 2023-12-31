//
//  HomeContracts.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation

//MARK: - Interactor
protocol HomeInteractorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    func load()
    func fetchPokemons()
    func selectPokemons(at index: Int)
}

enum HomeInteractorOutput {
    case showFeedPokemons([CombinedArray])
    case showSelectedPokemonDetail(CombinedArray)
}

protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(with output: HomeInteractorOutput)
}

//MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    func load()
    func selectPokemon(at index: Int)
}

enum HomePresenterOutput {
    case showFeedPokemons([CombinedArray])
}

//MARK: - View
protocol HomeViewProtocol: AnyObject {
    func handleOutput(with output: HomePresenterOutput)
}

//MARK: - Route
enum HomeRoute {
    case detail(CombinedArray)
}

protocol HomeRouteProtocol: AnyObject {
    func navigate(to route: HomeRoute)
}

