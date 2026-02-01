//
//  PokemonDetailViewData.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import Foundation
import SwiftUI

struct PokemonDetailViewData: Identifiable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let abilities: [PokemonAbilitySlotDTO]
    let types: [PokemonTypeSlotDTO]
    let stats: [PokemonStatsSlotDTO]
    let sprites: PokemonSpritesDTO
    
    var formattedId: String {
        String(format: "#%04d", id)
    }
    
    var formattedName: String {
        name.capitalized
    }
    
    var formattedWeight: String {
        "\(Double(weight) / 10) kg"
    }
    
    var formattedHeight: String {
        "\(Double(height) / 10) m"
    }
    
    var formattedAbilities: String {
        abilities
            .map { $0.ability.name.capitalized }
            .joined(separator: ", ")
    }
    
    var mainTypeName: String? {
        types.first?.type.name
    }
    
    var color: Color {
        Self.color(for: mainTypeName)
    }
    
    func color(for typeName: String) -> Color {
        Self.color(for: typeName)
    }
    
    private static func color(for typeName: String?) -> Color {
        switch typeName?.lowercased() {
        case "normal":
            return .gray.opacity(0.4)
        case "fighting":
            return .red
        case "flying":
            return .blue.opacity(0.6)
        case "poison":
            return .purple
        case "ground":
            return .brown
        case "rock":
            return .brown.opacity(0.7)
        case "bug":
            return .green.opacity(0.7)
        case "ghost":
            return .indigo
        case "steel":
            return .gray
        case "fire":
            return .orange
        case "water":
            return .blue
        case "grass":
            return .green
        case "electric":
            return .yellow
        case "psychic":
            return .pink
        case "ice":
            return .cyan
        case "dragon":
            return .blue.opacity(0.8)
        case "dark":
            return .black.opacity(0.3)
        case "fairy":
            return .pink.opacity(0.7)
        case "stellar":
            return .teal
        case "unknown":
            return .gray.opacity(0.5)
        default:
            return .gray
        }
    }
}

extension PokemonDetailViewData {
    init(dto: PokemonDetailDTO) {
        self.id = dto.id
        self.name = dto.name
        self.weight = dto.weight
        self.height = dto.height
        self.abilities = dto.abilities
        self.types = dto.types
        self.stats = dto.stats
        self.sprites = dto.sprites
    }
}

extension PokemonDetailViewData {
    static let mockPokemonDetail = PokemonDetailViewData(
        id: 214,
        name: "Ditto",
        weight: 40,
        height: 3,
        abilities: [
            PokemonAbilitySlotDTO(
                ability: NamedAPIResourceDTO(
                    name: "limber",
                    url: "https://pokeapi.co/api/v2/ability/7/"
                ),
                isHidden: false,
                slot: 1
            )
        ],
        types: [
            PokemonTypeSlotDTO(
                slot: 1,
                type: NamedAPIResourceDTO(
                    name: "normal",
                    url: "https://pokeapi.co/api/v2/type/1/"
                )
            )
        ],
        stats: [
            PokemonStatsSlotDTO(
                stat: NamedAPIResourceDTO(
                    name: "hp",
                    url: "https://pokeapi.co/api/v2/stat/1/"
                ),
                baseStat: 48
            )
        ],
        sprites: PokemonSpritesDTO(
            other: PokemonOtherSpritesDTO(
                officialArtwork: PokemonOfficialArtworkSpritesDTO(
                    frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png",
                    frontFemale: "",
                    frontShiny: "",
                    frontShinyFemale: ""
                )
            )
        )
    )
}

extension PokemonSpritesDTO {
    static let mockPokemonSprites = PokemonSpritesDTO(
        other: PokemonOtherSpritesDTO(
            officialArtwork: PokemonOfficialArtworkSpritesDTO(
                frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png",
                frontFemale: "",
                frontShiny: "",
                frontShinyFemale: ""
            )
        )
    )
}

extension PokemonStatsSlotDTO {
    static let mockPokemonStats = PokemonStatsSlotDTO(
        stat: NamedAPIResourceDTO(
            name: "hp",
            url: "https://pokeapi.co/api/v2/stat/1/"
        ),
        baseStat: 48
    )
}
