//
//  PokemonPageDTO.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonPageDTO: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonPageItemDTO]
}
