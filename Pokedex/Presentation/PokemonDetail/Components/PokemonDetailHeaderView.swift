//
//  PokemonDetailHeaderView.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import SwiftUI

struct PokemonDetailHeaderView: View {
    var pokemon: PokemonDetailViewData
    
    var body: some View {
        Rectangle()
            .fill(.clear)
            .overlay(
                ZStack(alignment: .bottom) {
                    sprite(pokemon.sprites)
                    VStack(alignment: .leading) {
                        Text(pokemon.formattedId)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text(pokemon.formattedName)
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
                        
                        typesSection(pokemon)
                        Spacer()
                    }
                }
            )
    }
    
    private func sprite(_ sprites: PokemonSpritesDTO) -> some View {
        let url = sprites.defaultSpriteURL
        return VStack {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 96, height: 96)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Color.gray
                        .frame(width: 96, height: 96)
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
    
    private func typesSection(_ pokemon: PokemonDetailViewData) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                ForEach(pokemon.types.sorted(by: { $0.slot < $1.slot }), id: \.slot) { typeSlot in
                    let typeName = typeSlot.type.name
                    Text(typeName.capitalized)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(pokemon.color(for: typeName))
                        .cornerRadius(8)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .shadow(radius: 5, x: 2, y: 2)
    }
}

#Preview {
    PokemonDetailHeaderView(
        pokemon: .mockPokemonDetail
    )
}
