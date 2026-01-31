//
//  PokemonRepository.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

protocol PokemonRepository {
    // Lista paginada
    func fetchPokemonPage(limit: Int, offset: Int) async throws -> PokemonPageDTO

    // Detalhe por nome (para search)
    func fetchPokemonDetail(name: String) async throws -> PokemonDetailDTO
}
