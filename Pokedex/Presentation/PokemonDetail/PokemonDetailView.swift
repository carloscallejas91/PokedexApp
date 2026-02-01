//
//  PokemonDetailView.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import SwiftUI

struct PokemonDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: PokemonDetailViewModel
    
    init(pokemonID: Int, viewModel: PokemonDetailViewModel? = nil) {
        if let viewModel {
            _viewModel = StateObject(wrappedValue: viewModel)
        } else {
            _viewModel = StateObject(wrappedValue: PokemonDetailViewModel(id: pokemonID))
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                if viewModel.isLoading {
                    ProgressView("Carregando...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else if let pokemon = viewModel.pokemon {
                    content(
                        pokemon: pokemon,
                        description: viewModel.descriptionText,
                        geo: geo
                    )
                } else {
                    Text("Nenhum dado disponível")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    DefaultIconButtonView(
                        onAction: { dismiss() },
                        icon: "chevron.left",
                        color: .clear
                    )
                }
            }
            .task { await viewModel.load() }
        }
    }
    
    private func content(
        pokemon: PokemonDetailViewData,
        description: String,
        geo: GeometryProxy
    ) -> some View {
        VStack(spacing: 0) {
            PokemonDetailHeaderView(pokemon: pokemon)
                .padding(.horizontal)
                .frame(height: geo.size.height * 1 / 3)
            
            PokemonDetailBodyView(
                pokemon: pokemon,
                description: description
            )
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(pokemon.color.opacity(0.8))
    }
}

#Preview {
    PokemonDetailView(pokemonID: 3)
}
