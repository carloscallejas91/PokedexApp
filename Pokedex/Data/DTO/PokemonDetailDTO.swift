//
//  PokemonDetailDTO.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonDetailDTO: Decodable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let abilities: [PokemonAbilitySlotDTO]
    let types: [PokemonTypeSlotDTO]
    let stats: [PokemonStatsSlotDTO]
    let sprites: PokemonSpritesDTO
}
