//
//  PokemonDetail.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation

struct PokemonAbilityModel: Decodable {
    let abilities: [AbilityItem]
    let sprites: PokemonImage
}

struct AbilityItem: Decodable {
    let ability: Ability
}

struct Ability: Decodable {
    let name: String
    let url: String
}

struct PokemonImage: Decodable {
    let frontDefault: String?
    
enum CodingKeys: String, CodingKey {
    case frontDefault = "front_default"
    }
}

struct CombinedArray {
    let name: String
    let image: String?
    let abilities: [String]
    
}

