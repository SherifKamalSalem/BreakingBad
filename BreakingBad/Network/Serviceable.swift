//
//  Service.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 27/08/2022.
//

import Foundation
import Combine

protocol Serviceable {
    func getCharacters() -> AnyPublisher<Characters, NetworkError>
}

class CharactersService: Serviceable {
    
    private var networkRequest: Requestable
    private var environment: Environment = .development
    
  // inject this for testability
    init(networkRequest: Requestable, environment: Environment) {
        self.networkRequest = networkRequest
        self.environment = environment
    }
    
    func getCharacters() -> AnyPublisher<[Character], NetworkError> {
        let endpoint = ListServiceEndpoints.getCharacters
        let request = endpoint.createRequest(environment: self.environment)
        return self.networkRequest.request(request)
    }
}
