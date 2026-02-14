//
//  EndPoints.swift
//  UserApp
//
//  Created by Purushottam Padhya on 14/2/2026.
//

import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
}

enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}



extension URLRequest {
    
    mutating func addHeaders(
        defaultHeaders: [String: String],
        endpointHeaders: [String: String]?
    ) {
        let merged = defaultHeaders.merging(endpointHeaders ?? [:]) { _, new in new }
        
        merged.forEach { key, value in
            setValue(value, forHTTPHeaderField: key)
        }
    }
}


enum ApiError: Error {
    case invalidURL
    case decodingError
    case statusCode(code: Int)
    case invalidResponse
}

extension ApiError {
   var localizedDescription: String {
      switch self {
      case .invalidURL:
         return "Invalid URL"
      case .decodingError:
         return "Error decoding the response"
      case .statusCode(let code):
          return "Server Error with code : \(code)"
      case .invalidResponse:
          return "Invalid Response error"
    
      }
   }
}


//MARK: - You can add your new end points here.

enum UsersEndpoint: APIEndpoint {
    var baseURL: URL {
            URL(string: "https://jsonplaceholder.typicode.com")!
        }
    
    case getUsers
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        }
    }
    
    var method: HTTPMethod {
        return HTTPMethod.GET
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getUsers:
            return nil
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}





