//
//  Endpoint.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 27/08/2022.
//

import Foundation

public typealias Headers = [String: String]

// if you wish you can have multiple services like this in a project
enum CharactersServiceEndpoints {
    case getCharacters
    
    // gave a default timeout but can be different for each.
    var requestTimeOut: Int {
        return 20
    }
    
    //specify the type of HTTP request
    var httpMethod: HTTPMethod {
        switch self {
        case .getCharacters:
            return .GET
        }
    }
    
    func createRequest(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        return NetworkRequest(url: getURL(from: environment), headers: headers, httpMethod: httpMethod)
    }
    
    // compose urls for each request
    func getURL(from environment: Environment) -> String {
        switch self {
        case .getCharacters:
            return ""
        }
    }
}
