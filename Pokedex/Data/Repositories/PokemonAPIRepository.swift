//
//  PokemonAPIRepository.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

final class PokemonAPIRepository: PokemonRepository, PokemonDetailRepository {

    private let baseURL = URL(string: "https://pokeapi.co/api/v2/")!
    private let client: NetworkClientProtocol

    init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }

    // MARK: - Lista de Pokémons
    func fetchPokemonPage(limit: Int, offset: Int) async throws -> PokemonPageDTO {
        var components = URLComponents(
            url: baseURL.appendingPathComponent("pokemon"),
            resolvingAgainstBaseURL: false
        )!

        components.queryItems = [
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "offset", value: String(offset))
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        return try await client.request(request)
    }

    // MARK: - Detalhe do Pokémon
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailDTO {
        let url = baseURL.appendingPathComponent("pokemon/\(id)")
        let request = URLRequest(url: url)
        return try await client.request(request)
    }

    func fetchPokemonDetail(name: String) async throws -> PokemonDetailDTO {
        let url = baseURL.appendingPathComponent("pokemon/\(name.lowercased())")
        let request = URLRequest(url: url)
        return try await client.request(request)
    }

    func fetchPokemonSpeciesDescription(id: Int) async throws -> String? {
        let url = baseURL.appendingPathComponent("pokemon-species/\(id)")
        let request = URLRequest(url: url)
        let species: PokemonSpeciesDTO = try await client.request(request)
        return species.soulSilverEnglishDescription
    }
}
