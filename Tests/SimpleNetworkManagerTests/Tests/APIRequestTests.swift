//
//  APIRequestTests.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/29/24.
//

import Foundation
import Testing
@testable import SimpleNetworkManager

@Suite("Tests for APIRequest protocol implementation in Request and MockAPIRequest")
struct APIRequestTests {
    
    @Test("API Request Test Success", arguments: HTTPMethod.allCases)
    func throwingInitTestSuccess(method: HTTPMethod) async throws {
        let url = URL(string: "https://example.com")
        let header: [String: String]? = nil
        let body: Data? = nil
        
        let request = try DefaultRequest(url: url, method: method)
        
        #expect(request.url == url)
        #expect(request.method == method)
        #expect(request.headers == header)
        #expect(request.body == body)
    }
    
    @Test("API Request Test Failure", arguments: HTTPMethod.allCases)
    func throwingInitTestFailure(method: HTTPMethod) async throws {
        #expect(throws: SimpleNetworkError.invalidURL) {
            try DefaultRequest(url: nil, method: method, headers: nil, body: nil)
        }
    }
}
