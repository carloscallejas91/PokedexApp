//
//  PokemonDetailBodyView.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import SwiftUI

struct PokemonDetailBodyView: View {
    let pokemon: PokemonDetailViewData
    var description: String
    
    @State private var selectedTab: DetailTab = .about
    
    enum DetailTab: String, CaseIterable, Identifiable {
        case about = "About"
        case gallery = "Gallery"
        
        var id: String { rawValue }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .overlay(
                VStack(alignment: .leading, spacing: 16) {
                    Picker("", selection: $selectedTab) {
                        ForEach(DetailTab.allCases) { tab in
                            Text(tab.rawValue).tag(tab)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    contentForSelectedTab
                    
                    Spacer()
                }
                .padding()
            )
    }
    
    @ViewBuilder
    private var contentForSelectedTab: some View {
        switch selectedTab {
        case .about:
            PokemonDetailAboutView(
                pokemon: pokemon,
                description: description
            )
        case .gallery:
            PokemonDetailGalleryView(sprites: pokemon.sprites)
        }
    }
}

#Preview {
    PokemonDetailBodyView(
        pokemon: .mockPokemonDetail,
        description: "Its transformation ability is perfect.\nHowever, if made to laugh, it\ncan't maintain its disguise."
    )
}
