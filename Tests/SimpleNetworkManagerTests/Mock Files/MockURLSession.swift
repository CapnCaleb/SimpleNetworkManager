//
//  MockURLSession.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/30/24.
//

import Foundation
import Testing
@testable import SimpleNetworkManager

enum MockURLSessionError: Error {
    case noData
}

class MockURLSession: URLSessionProtocol {
    var testData: Data?
    var testError: Error?

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let testError { throw testError }
        guard let testData else { throw MockURLSessionError.noData }
        return (testData, URLResponse())
    }
}
