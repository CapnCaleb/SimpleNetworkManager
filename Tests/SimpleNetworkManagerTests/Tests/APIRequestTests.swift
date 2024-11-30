//
//  APIRequestTests.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/29/24.
//

import Foundation
import Testing
@testable import SimpleNetworkManager

struct APIRequestTests {
    
    @Test("API Request Test Success", arguments: HTTPMethod.allCases)
    func throwingInitTestSuccess(method: HTTPMethod) async throws {
        let mockRequest = try MockAPIRequest(url: URL(string: "https://example.com"), method: method, headers: nil, body: nil)
        #expect(mockRequest.url != nil)
        #expect(mockRequest.method == method)
        #expect(mockRequest.headers == nil)
        #expect(mockRequest.body == nil)
    }
    
    @Test("API Request Test Failure", arguments: HTTPMethod.allCases)
    func throwingInitTestFailure(method: HTTPMethod) async throws {
        #expect(throws: APIRequestError.invalidURL) {
            try MockAPIRequest(url: nil, method: method, headers: nil, body: nil)
        }
    }
}
