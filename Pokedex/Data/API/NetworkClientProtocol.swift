//
//  NetworkClientProtocol.swift
//  PokedexApp
//
//  Created by macOS on 31/01/26.
//

import Foundation

protocol NetworkClientProtocol {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T
}
