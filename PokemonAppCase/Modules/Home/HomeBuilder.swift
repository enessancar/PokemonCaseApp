//
//  HomeBuilder.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation

final class HomeBuilder {
    
    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let router = HomeRouter(view: vc)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: vc, interactor: interactor, router: router)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc
    }
}
