//
//  PokemonListView.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import SwiftUI

@MainActor
struct PokemonListView: View {
    @StateObject private var viewModel = PokemonPageViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(alignment: .center, spacing: 16) {
                    Image("logotipo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                    
                    SearchBarView(
                        text: $viewModel.searchQuery,
                        onSearch: {
                            Task {
                                await viewModel.search()
                            }
                        }
                    )
                    .padding(.vertical)
                }
                .background(Color("PrimaryColor"))
                
                Divider()
                    .frame(height: 2)
                    .background(.orange)
                    .shadow(radius: 5, y: 2)
                
                if let error = viewModel.errorMessage, viewModel.pokemonsViewData.isEmpty {
                    Text(error)
                        .foregroundColor(.red)
                }
                
                PokemonResultPageView(
                    pokemons: viewModel.pokemonsViewData,
                    isLoadingPage: $viewModel.isLoadingPage,
                    onAppearItem: { item in
                        Task { await viewModel.onAppearItem(item) }
                    }
                )
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .task {
                await viewModel.loadInitialPage()
            }
        }
    }
}

#Preview {
    PokemonListView()
}
