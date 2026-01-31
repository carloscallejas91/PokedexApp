//
//  PokemonDetailRepository.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

protocol PokemonDetailRepository {
    // Detalhe por id
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailDTO

    // Descrição da espécie
    func fetchPokemonSpeciesDescription(id: Int) async throws -> String?
}
