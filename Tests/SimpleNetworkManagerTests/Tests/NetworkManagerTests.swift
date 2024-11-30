//
//  NetworkManagerTests.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/30/24.
//

import Foundation
import Testing

@testable import SimpleNetworkManager

struct NetworkManagerTests {
    struct TestResponse: Codable, Equatable {
        let message: String
    }
    
    enum TestError: Error, Equatable {
        case testError
        case decodingError
    }
    
    @Test
    func networkManagerReturnsDataSuccessfully() async throws {
        let mockSession = MockURLSession()
        let expectedData = "Test Response".data(using: .utf8)!
        mockSession.testData = expectedData
        
        let networkManager = NetworkManager(session: mockSession)
        let request = try DefaultRequest(url: URL(string: "https://example.com"), method: .get, headers: nil, body: nil)
        
        let returnedData = try await networkManager.performRequest(request)

        #expect(expectedData == returnedData)
    }
    
    @Test
    func networkManagersReturnsDecodedObjectSuccessfully() async throws {
        let mockSession = MockURLSession()
        let expectedObject = TestResponse(message: "Hello World")
        mockSession.testData = try JSONEncoder().encode(expectedObject)
        
        let networkManager = NetworkManager(session: mockSession)
        let request = try DefaultRequest(url: URL(string: "https://example.com"), method: .get, headers: nil, body: nil)
        
        let returnedObject: TestResponse = try await networkManager.performRequest(request, responseType: TestResponse.self)
        
        #expect(expectedObject == returnedObject)
    }
    
    @Test
    func networkManagerHasDataThrowsError() async throws {
        let mockSession = MockURLSession()
        let expectedData = "Test Response".data(using: .utf8)!
        mockSession.testData = expectedData
        mockSession.testError = TestError.testError
        
        let networkManager = NetworkManager(session: mockSession)
        let request = try DefaultRequest(url: URL(string: "https://example.com"), method: .get, headers: nil, body: nil)
        
        await #expect(throws: TestError.testError, performing: {
            let _ = try await networkManager.performRequest(request)
        })
    }
    
    @Test
    func networkManagerDecodingErrorThrowsError() async throws {
        let mockSession = MockURLSession()
        let badData = "Bad Data".data(using: .utf8)!
        mockSession.testData = badData
        mockSession.testError = TestError.decodingError
        
        let networkManager = NetworkManager(session: mockSession)
        let request = try DefaultRequest(url: URL(string: "https://example.com"), method: .get, headers: nil, body: nil)
        
        await #expect(throws: TestError.decodingError, performing: {
            do {
                let _ = try await networkManager.performRequest(request, responseType: TestResponse.self)
            } catch {
                throw TestError.decodingError
            }
        })
    }
    
    @Test
    func networkManagerImplicitClosureErrorThrowsError() async throws {
        let mockSession = MockURLSession()
        mockSession.testError = TestError.decodingError
        
        let networkManager = NetworkManager(session: mockSession)
        let request = try DefaultRequest(url: URL(string: "https://example.com"), method: .get, headers: nil, body: nil)
        
        await #expect(throws: TestError.decodingError, performing: {
            let _ = try await networkManager.performRequest(request, responseType: TestResponse.self)
        })
    }
}
