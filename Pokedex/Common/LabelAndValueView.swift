//
//  LabelAndValueView.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import SwiftUI

struct LabelAndValueView: View {
    let label: String
    let value: String
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(label.uppercased()):")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(color)
                .frame(width: 150, alignment: .leading)
            
            Text(value)
                .font(.body)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    LabelAndValueView(
        label: "Test",
        value: "123",
        color: Color("AccentColor")
    )
}
