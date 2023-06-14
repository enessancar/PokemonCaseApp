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
    let species: Species
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
    let name: String?
    let image: String?
    let abilities: [String]
    
    var _image: String {
        image ?? "N/A"
    }
    
    var _name: String {
        name ?? "N/A"
    }
}

// MARK: - Species
struct Species: Decodable {
    let name: String
    let url: String
}

