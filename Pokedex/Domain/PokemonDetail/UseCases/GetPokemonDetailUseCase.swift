//
//  GetPokemonDetailUseCase.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

final class GetPokemonDetailUseCase {
    private let repository: PokemonDetailRepository

    init(repository: PokemonDetailRepository) {
        self.repository = repository
    }

    func execute(id: Int) async throws -> PokemonDetailDTO {
        try await repository.fetchPokemonDetail(id: id)
    }
}
