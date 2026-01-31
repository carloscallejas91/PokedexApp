//
//  LoadPokemonPageUseCase.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

protocol LoadPokemonPageUseCaseProtocol {
    func execute(state: PokemonListState) async throws -> PokemonListState
}

final class LoadPokemonPageUseCase: LoadPokemonPageUseCaseProtocol {
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
    
    func execute(state: PokemonListState) async throws -> PokemonListState {
        guard !state.isSearching, state.canLoadMore else { return state }
        
        let response = try await repository.fetchPokemonPage(
            limit: state.limit,
            offset: state.offset
        )
        
        var newState = state
        newState.totalCount = response.count
        newState.items += response.results
        newState.offset += state.limit
        newState.canLoadMore = newState.items.count < newState.totalCount
        
        return newState
    }
}
