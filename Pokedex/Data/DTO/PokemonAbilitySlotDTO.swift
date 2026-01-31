//
//  PokemonAbilitySlotDTO.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonAbilitySlotDTO: Decodable {
    let ability: NamedAPIResourceDTO
    let isHidden: Bool
    let slot: Int
    
    private enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}
