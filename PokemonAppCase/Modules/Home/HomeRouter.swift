//
//  HomeRouter.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit

final class HomeRouter: HomeRouteProtocol {
    
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: HomeRoute) {
        switch route {
        case .detail(let pokemonModel):
            let vc = HomeDetailBuilder.make(with: pokemonModel)
            view.show(vc, sender: nil)
        }
    }
}

