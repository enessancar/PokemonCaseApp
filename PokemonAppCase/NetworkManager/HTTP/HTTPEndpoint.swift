//
//  HTTPEndpoint.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation

protocol HTTPEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var query: [URLQueryItem]? { get }
    var method: HTTPMethods { get }
}

extension HTTPEndpoint {
    var scheme: String { "https" }
    var host: String { "pokeapi.co" }
    var method: HTTPMethods { .get }
}

//MARK: - Path
enum Path: String {
    case pokemons = "/api/v2/pokemon/"
}

