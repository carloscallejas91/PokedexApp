//
//  GetPokemonDescriptionUseCase.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

final class GetPokemonDescriptionUseCase {
    private let repository: PokemonDetailRepository

    init(repository: PokemonDetailRepository) {
        self.repository = repository
    }

    func execute(id: Int) async throws -> String? {
        try await repository.fetchPokemonSpeciesDescription(id: id)
    }
}
