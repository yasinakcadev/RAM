//
//  NetworkManager.swift
//  RAM
//
//  Created by Yasin AKÇA
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func apiCall<T:Codable>(
        _ urlString: String,
        expecting type: T.Type
    ) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decodedResult = try JSONDecoder().decode(T.self, from: data)
        return decodedResult
    }
}
