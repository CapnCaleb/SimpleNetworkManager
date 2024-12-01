//
//  NetworkManager.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/30/24.
//


import Foundation

public struct NetworkManager {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func performRequest(_ request: APIRequest) async throws -> Data {
        var urlRequest = URLRequest(url: request.url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        
        let (data, _) = try await session.data(for: urlRequest)
        return data
    }
    
    func performRequest<T: Decodable>(_ request: APIRequest, responseType: T.Type) async throws -> T {
        let data = try await performRequest(request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
