//
//  SearchPokemonUseCase.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

protocol SearchPokemonUseCaseProtocol {
    func execute(query: String) async throws -> [PokemonPageItemDTO]
}

final class SearchPokemonUseCase: SearchPokemonUseCaseProtocol {
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
    
    func execute(query: String) async throws -> [PokemonPageItemDTO] {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return [] }
        
        let detail = try await repository.fetchPokemonDetail(name: trimmed)
        
        let listItem = PokemonPageItemDTO(
            name: detail.name,
            url: "https://pokeapi.co/api/v2/pokemon/\(detail.id)/"
        )
        
        return [listItem]
    }
}
