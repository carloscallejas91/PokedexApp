//
//  PokemonListViewData.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonListViewData: Identifiable {
    let id: Int
    let name: String
    let defaultSpriteURL: URL?
    
    init(id: Int, name: String, defaultSpriteURL: URL? = nil) {
        self.id = id
        self.name = name
        self.defaultSpriteURL = defaultSpriteURL
    }
    
    var formattedNumber: String {
        "#\(id)"
    }
}

extension PokemonListViewData {
    init(dto: PokemonPageItemDTO) {
        let trimmed = dto.url.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        let components = trimmed.split(separator: "/")
        let idString = components.last ?? "0"
        let id = Int(idString) ?? 0
        
        let spriteURL = URL(
            string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
        )
        
        self.init(
            id: id,
            name: dto.name,
            defaultSpriteURL: spriteURL
        )
    }
}

extension PokemonListViewData {
    static let mockPokemonItem = PokemonListViewData(
        id: 1,
        name: "Bulbasaur",
        defaultSpriteURL: URL(
            string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
        )
    )
}

extension PokemonListViewData {
    static let mockPokemonResult: [PokemonListViewData] = [
        PokemonListViewData(
            id: 1,
            name: "Bulbasaur",
            defaultSpriteURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
        ),
        PokemonListViewData(
            id: 2,
            name: "Ivysaur",
            defaultSpriteURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png")
        ),
        PokemonListViewData(
            id: 3,
            name: "Venusaur",
            defaultSpriteURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png")
        )
    ]
}
