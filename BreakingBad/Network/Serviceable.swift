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
