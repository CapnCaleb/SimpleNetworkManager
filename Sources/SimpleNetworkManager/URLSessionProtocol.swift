//
//  URLSessionProtocol.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/30/24.
//

import Foundation

public protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}
