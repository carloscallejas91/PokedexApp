//
//  PokemonSpeciesDTO.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonSpeciesDTO: Decodable {
    let flavorTextEntries: [PokemonFlavorTextEntryDTO]

    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }

    var soulSilverEnglishDescription: String? {
        flavorTextEntries
            .first {
                $0.language.name == "en" &&
                $0.version.name == "soulsilver"
            }?
            .flavorText
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\u{000c}", with: " ")
    }
}

struct PokemonFlavorTextEntryDTO: Decodable {
    let flavorText: String
    let language: NamedAPIResourceDTO
    let version: NamedAPIResourceDTO

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case version
    }
}
