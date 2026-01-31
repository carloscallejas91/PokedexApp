//
//  DefaultIconButtonView.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import SwiftUI

struct DefaultIconButtonView: View {
    let onAction: () -> Void
    let icon: String
    let color: Color
    
    var body: some View {
        Button {
            Task {
                onAction()
            }
        } label: {
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 6)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(color))
    }
}

#Preview {
    DefaultIconButtonView(
        onAction: { print("Action!") },
        icon: "magnifyingglass",
        color: .blue
    )
}
