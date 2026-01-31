//
//  PokemonSpritesDTO.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonOfficialArtworkSpritesDTO: Decodable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?

    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct PokemonOtherSpritesDTO: Decodable {
    let officialArtwork: PokemonOfficialArtworkSpritesDTO

    private enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct PokemonSpritesDTO: Decodable {
    let other: PokemonOtherSpritesDTO

    var defaultSpriteURL: URL? {
        guard let urlString = other.officialArtwork.frontDefault else { return nil }
        return URL(string: urlString)
    }

    var officialArtworkSpriteURLs: [URL] {
        [
            other.officialArtwork.frontDefault,
            other.officialArtwork.frontFemale,
            other.officialArtwork.frontShiny,
            other.officialArtwork.frontShinyFemale
        ]
        .compactMap { $0 }
        .compactMap(URL.init(string:))
    }
}
