//
//  CharactersListServiceAPIMock.swift
//  BreakingBadTests
//
//  Created by Sherif Kamal on 30/08/2022.
//

import XCTest
import Combine
@testable import BreakingBad

class MockAPIServiceCharactersList:  Serviceable {
    func getCharacters() -> AnyPublisher<Characters, NetworkError> {
        let jsonData = SwiftUtility.loadJson(filename: "CharactersList")
        return Future<Data, Error> { promise in
            promise(.success(jsonData))
        }
        .decode(type: [Character].self, decoder: JSONDecoder())
        .mapError { error in
            // return error if json decoding fails
            NetworkError.invalidJSON(String(describing: error))
        }
        .eraseToAnyPublisher()
    }
}
