//
//  APIRequest.swift
//  SimpleNetworkManager
//
//  Created by Caleb on 11/29/24.
//

import Foundation

public protocol APIRequest {
    var url: URL { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    
    init (url: URL?, method: HTTPMethod, headers: [String: String]?, body: Data?) throws
}
