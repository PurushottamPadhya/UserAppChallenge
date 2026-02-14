//
//  APIClient.swift
//  UserApp
//
//  Created by Purushottam Padhya on 14/2/2026.
//
import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(_ endpoint: any APIEndpoint) async throws -> T
}

struct APIClient: APIClientProtocol {
    private let session: URLSession
    
    // using shared session to have single instance of the session
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // requesting url endpoints provided with the type of T<Generic>
    func request<T: Decodable>(_ endpoint: any APIEndpoint) async throws -> T {
                
        // Appending base url with the path of the requesting component.
        var component = URLComponents(
            url: endpoint.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false)
        
        // Adding any query parameter if presented on the endpoints
        component?.queryItems = endpoint.queryItems
        
        // validation of url
        guard let url = component?.url else {
            throw URLError(.badURL)
        }
        
        // create a URLRequest from provided url
        var request = URLRequest(url: url)
        
        // set HTTP method type on your request.
        request.httpMethod = endpoint.method.rawValue
        
        
        // adding custom headers with the default one within your request
        let defaultHeaders = [
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                ]
        request.addHeaders(
                    defaultHeaders: defaultHeaders,
                    endpointHeaders: endpoint.headers
                )
        
        
        // get data and response using session.data
        let (data, response) = try await session.data(for: request)
        
        // validation of response else throw error
        guard let httpResponse = response as? HTTPURLResponse
                      
        else {
            throw ApiError.invalidResponse
        }
        
        // validation of status code else throw error
        guard 200..<300 ~= httpResponse.statusCode else {
            throw ApiError.statusCode(code: httpResponse.statusCode)
        }
        
        // Decode the response data using JSONDecoder and return if success
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw ApiError.decodingError
        }
    }
}
