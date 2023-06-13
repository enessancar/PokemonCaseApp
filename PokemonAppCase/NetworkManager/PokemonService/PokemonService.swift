//
//  PokemonService.swift
//  PokemonAppCase
//
//  Created by Enes Sancar on 13.06.2023.
//

import Foundation

protocol PokemonServiceInterface: AnyObject {
    func fetchPokemons(endPoint: PokemonEndpoint, completion: @escaping (Result<PokemonModel,CustomError>) -> Void)
    func fetchPokemonsDetail(endPoint: PokemonEndpoint, completion: @escaping (Result<PokemonAbilityModel,CustomError>) -> Void)
}

final class PokemonService: PokemonServiceInterface {
    
    private let coreService: CoreServiceProtokol
    
    init(service: CoreServiceProtokol) {
        self.coreService = service
    }
    
    func fetchPokemons(endPoint: PokemonEndpoint, completion: @escaping (Result<PokemonModel, CustomError>) -> Void) {
        coreService.makeRequest(endPoint: endPoint) { (result: Result<PokemonModel, CustomError>) in
            completion(result)
        }
    }
    func fetchPokemonsDetail(endPoint: PokemonEndpoint, completion: @escaping (Result<PokemonAbilityModel, CustomError>) -> Void) {
        coreService.makeRequest(endPoint: endPoint) { (result: Result<PokemonAbilityModel, CustomError>) in
            completion(result)
        }
    }
}
