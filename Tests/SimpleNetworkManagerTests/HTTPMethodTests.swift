//
//  HTTPMethodTests.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/29/24.
//

import Foundation
import Testing
@testable import SimpleNetworkManager

struct HTTPMethodTests {
    @Test func testGetMethod() async throws {
        let method = HTTPMethod.get
        #expect(method.rawValue == "GET")
    }
    
    @Test func testPostMethod() async throws {
        let method = HTTPMethod.post
        #expect(method.rawValue == "POST")
    }
    
    @Test func testPutMethod() async throws {
        let method = HTTPMethod.put
        #expect(method.rawValue == "PUT")
    }
    
    @Test func testDeleteMethod() async throws {
        let method = HTTPMethod.delete
        #expect(method.rawValue == "DELETE")
    }
}
