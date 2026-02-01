//
//  PokemonPageItemView.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import SwiftUI

struct PokemonPageItemView: View {
    let pokemon: PokemonPageViewData
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.gray.opacity(0.1)
                Color.gray.opacity(0.3)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(spacing: 8) {
                Text(pokemon.formattedNumber)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding([.top, .horizontal], 8)
                
                Spacer(minLength: 4)
                
                AsyncImage(url: pokemon.defaultSpriteURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 56, height: 56)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80)
                            .shadow(color: .gray.opacity(0.9), radius: 4, x: 2, y: 3)
                    case .failure:
                        Color.gray
                            .frame(width: 56, height: 56)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Spacer(minLength: 4)
                
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding(.bottom, 8)
            }
            .padding(.horizontal, 8)
        }
        .background(.white)
        .frame(maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .gray.opacity(0.7), radius: 1, x: 2, y: 2)
    }
}

#Preview {
    PokemonPageItemView(
        pokemon: .mockPokemonItem
    )
    .padding(60)
}
