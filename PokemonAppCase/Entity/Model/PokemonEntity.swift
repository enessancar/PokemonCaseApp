//
//  PokemonModel.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation

struct PokemonModel: Decodable {
    let results: [Pokemons]
}

struct Pokemons: Decodable {
    let name: String
    let url: String
} 
