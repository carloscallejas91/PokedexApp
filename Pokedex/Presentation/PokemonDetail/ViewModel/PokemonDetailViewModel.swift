//
//  PokemonDetailViewModel.swift
//  PokedexApp
//
//  Created by macOS on 01/02/26.
//

import Foundation

@MainActor
final class PokemonDetailViewModel: ObservableObject {
    @Published private(set) var pokemon: PokemonDetailViewData?
    @Published private(set) var descriptionText: String = "Carregando descrição..."
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    
    private let id: Int
    private let getDetailUseCase: GetPokemonDetailUseCase
    private let getDescriptionUseCase: GetPokemonDescriptionUseCase
    
    init(
        id: Int,
        getDetailUseCase: GetPokemonDetailUseCase,
        getDescriptionUseCase: GetPokemonDescriptionUseCase
    ) {
        self.id = id
        self.getDetailUseCase = getDetailUseCase
        self.getDescriptionUseCase = getDescriptionUseCase
    }
    
    convenience init(id: Int, repository: PokemonDetailRepository = PokemonAPIRepository()) {
        let detailUseCase = GetPokemonDetailUseCase(repository: repository)
        let descriptionUseCase = GetPokemonDescriptionUseCase(repository: repository)
        
        self.init(
            id: id,
            getDetailUseCase: detailUseCase,
            getDescriptionUseCase: descriptionUseCase
        )
    }
    
    func load() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let detailDTO = try await getDetailUseCase.execute(id: id)
            pokemon = PokemonDetailViewData(dto: detailDTO)
            
            if let description = try await getDescriptionUseCase.execute(id: id) {
                descriptionText = description
            } else {
                descriptionText = "Sem descrição."
            }
        } catch {
            errorMessage = "Falha ao carregar o pokémon. Tente novamente mais tarde."
            pokemon = nil
            descriptionText = ""
        }
        
        isLoading = false
    }
}
