//
//  SearchBarView.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    let onSearch: () -> Void
    
    var body: some View {
        HStack {
            Image("pokeball")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            TextField("pokemon", text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            DefaultIconButtonView(
                onAction: onSearch,
                icon: "magnifyingglass",
                color: Color("PrimaryColor")
            )
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.orange, lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemBackground))
                )
        )
        .padding(.horizontal)
    }
}

#Preview {
    SearchBarView(
        text: .constant(""),
        onSearch: {}
    )
}
