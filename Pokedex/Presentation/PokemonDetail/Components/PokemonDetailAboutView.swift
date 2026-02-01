//
//  PokemonDetailAboutView.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import SwiftUI

struct PokemonDetailAboutView: View {
    let pokemon: PokemonDetailViewData
    var description: String
    
    private var accentColor: Color { pokemon.color }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
            
            Divider()
            
            LabelAndValueView(label: "Altura", value: "\(pokemon.formattedHeight)", color: accentColor)
            LabelAndValueView(label: "Peso", value: "\(pokemon.formattedWeight)", color: accentColor)
            LabelAndValueView(label: "Habilidades", value: "\(pokemon.formattedAbilities)", color: accentColor)
            
            Divider()
            
            statsSection(stats: pokemon.stats, color: accentColor)
        }
    }
    
    private func statsSection(stats: [PokemonStatsSlotDTO], color: Color) -> some View {
        ForEach(stats, id: \.stat.name) { stat in
            PokemonDetailStatRowView(stat: stat, maxStat: 100, color: color)
        }
    }
}

#Preview {
    PokemonDetailAboutView(
        pokemon: .mockPokemonDetail,
        description: "Its transformation ability is perfect.\nHowever, if made to laugh, it\ncan't maintain its disguise."
    )
}
