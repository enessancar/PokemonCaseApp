//
//  HomeDetailBuilder.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation

final class HomeDetailBuilder {
    
    static func make(with pokemon: CombinedArray) -> HomeDetailView {
        let vc = HomeDetailView()
        let interactor = HomeDetailInteractor()
        let presenter = HomeDetailPresenter(view: vc, interactor: interactor, combinedArray: pokemon)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc
    }
}
