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
    @Test func testGetMethod() async {
        let method = HTTPMethod.get
        #expect(method.rawValue == "GET")
    }
    
    @Test func testPostMethod() async {
        let method = HTTPMethod.post
        #expect(method.rawValue == "POST")
    }
    
    @Test func testPutMethod() async {
        let method = HTTPMethod.put
        #expect(method.rawValue == "PUT")
    }
    
    @Test func testDeleteMethod() async {
        let method = HTTPMethod.delete
        #expect(method.rawValue == "DELETE")
    }
}
