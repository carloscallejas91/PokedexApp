//
//  PokemonResultPageView.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import SwiftUI

struct PokemonResultPageView: View {
    let pokemons: [PokemonPageViewData]
    @Binding var isLoadingPage: Bool
    let onAppearItem: (PokemonPageViewData) -> Void
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(pokemons) { pokemon in
                    NavigationLink {
                        // PokemonDetailView(pokemonID: pokemon.id)
                    } label: {
                        PokemonPageItemView(pokemon: pokemon)
                            .task {
                                onAppearItem(pokemon)
                            }
                    }
                }
                
                if isLoadingPage {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .padding()
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .background(.white)
    }
}

#Preview {
    struct PokemonResultListViewPreviewWrapper: View {
        @State var isLoadingPage: Bool = false
        
        var body: some View {
            PokemonResultPageView(
                pokemons: PokemonPageViewData.mockPokemonResult,
                isLoadingPage: $isLoadingPage,
                onAppearItem: { _ in }
            )
        }
    }
    
    return PokemonResultListViewPreviewWrapper()
}
