//
//  DefaultRequest.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/29/24.
//

import Foundation

public struct DefaultRequest: APIRequest {
    public let url: URL
    public let method: HTTPMethod
    public let headers: [String: String]?
    public let body: Data?

    public init(url: URL?, method: HTTPMethod, headers: [String: String]? = nil, body: Data? = nil) throws {
        guard let url else { throw SimpleNetworkError.invalidURL }
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
}
