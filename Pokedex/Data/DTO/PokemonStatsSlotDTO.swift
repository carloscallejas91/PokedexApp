//
//  PokemonStatsSlotDTO.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonStatsSlotDTO: Decodable {
    let stat: NamedAPIResourceDTO
    let baseStat: Int

    private enum CodingKeys: String, CodingKey {
        case stat
        case baseStat = "base_stat"
    }
}
