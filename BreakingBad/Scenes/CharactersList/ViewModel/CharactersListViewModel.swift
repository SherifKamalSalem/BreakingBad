//
//  CharactersListViewModel.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 27/08/2022.
//

import Foundation
import SwiftUI
import Combine


class CharactersListViewModel: NSObject, ObservableObject, Identifiable {
    enum State {
        case finished
        case loading
    }
    
    @Published private(set) var state = State.loading
    
    private let charactersService: Serviceable
    @Published var dataSource: [CharacterRowViewModel] = []
    @Published var searchResultDataSource: [CharacterRowViewModel] = []
    
    
    private var disposables = Set<AnyCancellable>()
    
    let willChange = PassthroughSubject<Void, Never>()
    
    init(charactersService: Serviceable) {
        self.charactersService = charactersService
        super.init()
        self.loadCharacters()
    }
    
    func loadCharacters() {
        let service = charactersService.getCharacters()
        service
            .map { response in
                response.map(CharacterRowViewModel.init)
            }
            .map(Array.removeDuplicates)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.state = .finished
                        self.dataSource = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] dataSource in
                    guard let self = self else { return }
                    self.state = .finished
                    self.dataSource = dataSource
                })
            .store(in: &disposables)
    }
}


