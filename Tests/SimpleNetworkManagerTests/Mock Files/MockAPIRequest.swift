struct MockAPIRequest: APIRequest {
    let url: URL
    let method: HTTPMethod
    let headers: [String : String]?
    let body: Data?
    
    init(url: URL?, method: HTTPMethod, headers: [String : String]?, body: Data?) throws {
        guard let url else { throw APIRequestError.invalidURL }
        
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
}