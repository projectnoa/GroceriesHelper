//
//  NetworkManager.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/18/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = "https://hl3rc1r0od.execute-api.us-west-2.amazonaws.com"
    let stage = "Testing"
    
    private init() {
        
    }
    
    enum Resources {
        case ingredients
        case dishes
        case groceries
        case locations
    }
    
    enum NetworkError: Error {
        case InvalidURL
        case ResourceNotFound
        case InvalidResource
        case ServerError
        case InvalidResponse
    }
        
    func get<T:Decodable>(_ resource: Resources) async -> [T]? {
        do {
            let url = try url(for: resource)
            
            guard let data = try await execute(URLRequest(url: url)) else {
                throw NetworkError.InvalidResponse
            }
            
            if let model = try JSONDecoder().decode([T]?.self, from: data) {
                return model
            } else {
                throw NetworkError.InvalidResponse
            }
        } catch {
            print("Network error: \(error)")
        }
        
        return nil
    }
    
    func post<T:Codable>(_ resource: Resources, _ model: T) async -> [T]? {
        do {
            let url = try url(for: resource)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            request.httpBody = try JSONEncoder().encode(model)
            
            guard let data = try await execute(request) else {
                throw NetworkError.InvalidResponse
            }
            
            if let model = try JSONDecoder().decode([T]?.self, from: data) {
                return model
            } else {
                throw NetworkError.InvalidResponse
            }
        } catch {
            print("Network error: \(error)")
        }
        
        return nil
    }
    
    func url(for resource: Resources) throws -> URL {
        let url: URL? = URL(string: "\(baseURL)/\(stage)/\(String(describing: resource))")
        
        guard let url = url else {
            throw NetworkError.InvalidURL
        }
        
        return url
    }
    
    private func execute(_ request: URLRequest) async throws -> Data? {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.ServerError
        }
        
        switch response.statusCode {
        case 400...499:
            throw NetworkError.ResourceNotFound
        case 500...599:
            throw NetworkError.ServerError
        case 200...299:
            return data
        default:
            throw NetworkError.InvalidResource
        }
    }
}
