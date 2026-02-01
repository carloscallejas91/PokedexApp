//
//  PokemonListState.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

struct PokemonPageState {
    var items: [PokemonPageItemDTO]
    var offset: Int
    var limit: Int
    var canLoadMore: Bool
    var totalCount: Int
    var isSearching: Bool
}
