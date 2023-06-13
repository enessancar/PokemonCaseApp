//
//  AppRouter.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let startVC = HomeBuilder.make()
        let nav = UINavigationController(rootViewController: startVC)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}

let appContainer = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
}
