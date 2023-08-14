//
//  NetworkManager.swift
//  AwaitAsync
//
//  Created by ByungHoon Ann on 2023/08/14.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func fetchData() async throws -> String {
        let url = URL(string: "https://api.example.com/data")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return String(data: data, encoding: .utf8) ?? "Error decoding data"
    }
    
    func performFetch() async {
        do {
            let result = try await fetchData()
            print("Fetched data: \(result)")
        } catch {
            print("Error: \(error)")
        }
    }
}
