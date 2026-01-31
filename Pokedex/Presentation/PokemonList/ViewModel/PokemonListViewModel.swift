//
//  PokemonListViewModel.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

@MainActor
final class PokemonListViewModel: ObservableObject {
    // Expostos para a View
    @Published private(set) var pokemonsViewData: [PokemonPageViewData] = []
    @Published var searchQuery: String = ""
    @Published var isLoadingPage: Bool = false
    @Published private(set) var errorMessage: String?
    
    // Estado interno de domínio
    private var listState = PokemonPageState(
        items: [],
        offset: 0,
        limit: 20,
        canLoadMore: true,
        totalCount: 0,
        isSearching: false
    )
    
    // Casos de uso
    private let loadPageUseCase: LoadPokemonPageUseCaseProtocol
    private let searchUseCase: SearchPokemonUseCaseProtocol
    
    init(
        loadPageUseCase: LoadPokemonPageUseCaseProtocol = LoadPokemonPageUseCase(repository: PokemonAPIRepository()),
        searchUseCase: SearchPokemonUseCaseProtocol = SearchPokemonUseCase(repository: PokemonAPIRepository())
    ) {
        self.loadPageUseCase = loadPageUseCase
        self.searchUseCase = searchUseCase
    }
    
    func loadInitialPage() async {
        guard listState.items.isEmpty else { return }
        await loadNextPage()
    }
    
    func loadNextPage() async {
        guard !isLoadingPage, listState.canLoadMore, !listState.isSearching else { return }
        
        isLoadingPage = true
        errorMessage = nil
        
        do {
            listState = try await loadPageUseCase.execute(state: listState)
            pokemonsViewData = listState.items.map(PokemonPageViewData.init(dto:))
        } catch {
            errorMessage = "Falha ao carregar Pokemons. Tente novamente mais tarde."
        }
        
        isLoadingPage = false
    }
    
    func refresh() async {
        listState = PokemonPageState(
            items: [],
            offset: 0,
            limit: listState.limit,
            canLoadMore: true,
            totalCount: 0,
            isSearching: false
        )
        pokemonsViewData = []
        await loadInitialPage()
    }
    
    func onAppearItem(_ item: PokemonPageViewData) async {
        guard let last = pokemonsViewData.last, last.id == item.id else { return }
        await loadNextPage()
    }
    
    func search() async {
        let query = searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty else {
            listState.isSearching = false
            errorMessage = nil
            if listState.items.isEmpty {
                await loadInitialPage()
            } else {
                await refresh()
            }
            return
        }
        
        listState.isSearching = true
        isLoadingPage = true
        errorMessage = nil
        
        do {
            let result = try await searchUseCase.execute(query: query)
            listState.items = result
            listState.canLoadMore = false
            pokemonsViewData = result.map(PokemonPageViewData.init(dto:))
        } catch {
            listState.items = []
            pokemonsViewData = []
            errorMessage = "Pokemon não encontrado."
        }
        
        isLoadingPage = false
    }
}
