//
//  PokemonDetailGalleryView.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import SwiftUI

struct PokemonDetailGalleryView: View {
    var sprites: PokemonSpritesDTO
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(sprites.officialArtworkSpriteURLs, id: \.absoluteString) { url in
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 96, height: 96)
                        case .success(let image):
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray.opacity(0.1))
                                .overlay(
                                    image
                                        .resizable()
                                        .scaledToFit()
                                )
                                .scaledToFit()
                                .shadow(color: .gray.opacity(0.9), radius: 4, x: 2, y: 3)
                        case .failure:
                            Color.gray
                                .frame(width: 96, height: 96)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonDetailGalleryView(
        sprites: .mockPokemonSprites
    )
}
