//
//  SceneDelegate.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appRouter: AppRouter?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        appRouter = AppRouter()
        appRouter?.start()
        window = appRouter?.window
        window?.windowScene = scene
    }
}
