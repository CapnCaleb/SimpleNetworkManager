//
//  URLSessionProtocol.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/30/24.
//

import Foundation

//MARK: Declaration
protocol URLSessionProtocol {
    static var shared: URLSession { get }
    func data(for request: URLRequest, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}

//MARK: Conformance
extension URLSession: URLSessionProtocol { }
