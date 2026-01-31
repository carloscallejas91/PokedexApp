//
//  PokemonTypeSlotDTO.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonTypeSlotDTO: Decodable {
    let slot: Int
    let type: NamedAPIResourceDTO
}
