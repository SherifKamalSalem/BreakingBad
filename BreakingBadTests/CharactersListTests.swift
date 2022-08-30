//
//  CharactersListTests.swift
//  BreakingBadTests
//
//  Created by Sherif Kamal on 30/08/2022.
//

import XCTest
@testable import BreakingBad

class CharactersListTests: XCTestCase {
    var sut: CharactersListViewModel?

    override func setUp() {
        super.setUp()
        sut = CharactersListViewModel(charactersService: MockAPIServiceCharactersList())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchCharacters() {

        // Given A API Model
        let sut = self.sut!
        
        // When
        sut.loadCharacters()

        XCTAssertFalse(sut.dataSource.isEmpty)
        for obj in sut.dataSource {
            XCTAssertNotNil(obj.id)
        }
    }

}
