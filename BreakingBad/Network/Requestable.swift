//
//  Requestable.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 27/08/2022.
//

import Foundation
import Combine

public protocol Requestable {
    var requestTimeOut: Float { get }
    
    func request<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError>
}
