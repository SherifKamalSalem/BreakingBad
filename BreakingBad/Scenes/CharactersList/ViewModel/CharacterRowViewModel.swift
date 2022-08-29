//
//  CharacterRowViewModel.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 27/08/2022.
//

import Foundation
import SwiftUI

class CharacterRowViewModel: ObservableObject, Identifiable {
    private let item: Character
    
    var id: Int {
        return item.charId
    }
    
    
    var birthday: String {
        return item.birthday ?? ""
    }
    
    var category: Category {
        item.category
    }
    
    var name: String {
        item.name ?? ""
    }
    
    var nickname: String {
        item.nickname ?? ""
    }
    
    var imageURL: URL? {
        if let url = item.img {
            return URL(string: url)
        }
        return nil
    }
    
    init(item: Character) {
        self.item = item
    }
}

extension CharacterRowViewModel: Hashable {
    static func == (lhs: CharacterRowViewModel, rhs: CharacterRowViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
