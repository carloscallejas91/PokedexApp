//
//  PokemonDetailStatRowView.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import SwiftUI

struct PokemonDetailStatRowView: View {
    let stat: PokemonStatsSlotDTO
    let maxStat: Double
    let color: Color
    
    private var shortName: String {
        switch stat.stat.name.lowercased() {
        case "hp": return "HP"
        case "attack": return "ATK"
        case "defense": return "DEF"
        case "special-attack": return "SATK"
        case "special-defense": return "SDEF"
        case "speed": return "SPD"
        default: return stat.stat.name.uppercased()
        }
    }
    
    private var formattedValue: String {
        String(format: "%03d", stat.baseStat)
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Text(shortName)
                .font(.body)
                .fontWeight(.bold)
                .frame(width: 48, alignment: .leading)
                .foregroundColor(color)
            
            Text(formattedValue)
                .font(.body)
                .frame(width: 36, alignment: .leading)
                .foregroundColor(.gray)
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(color.opacity(0.2))
                    
                    Capsule()
                        .fill(color)
                        .frame(
                            width: geo.size.width
                            * min(Double(stat.baseStat) / maxStat, 1.0)
                        )
                }
            }
            .frame(height: 16)
        }
    }
}

#Preview {
    PokemonDetailStatRowView(
        stat: .mockPokemonStats,
        maxStat: 100,
        color: Color(.red)
    )
}
