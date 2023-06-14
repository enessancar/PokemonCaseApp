//
//  HomePresenter.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation

//MARK: - HomePresenterProtocol
final class HomePresenter: HomePresenterProtocol {
    
    private weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouteProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouteProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func load() {
        interactor.load()
    }
    func selectPokemon(at index: Int) {
        interactor.selectPokemons(at: index)
    }
}
//MARK: - HomeInteractorDelegate 
extension HomePresenter: HomeInteractorDelegate {
    func handleOutput(with output: HomeInteractorOutput) {
        switch output {
        case .showFeedPokemons(let combinedArray):
            view?.handleOutput(with: .showFeedPokemons(combinedArray))
        case .showSelectedPokemonDetail(let selectedPokemon):
            router.navigate(to: .detail(selectedPokemon))
        }
    }
}
