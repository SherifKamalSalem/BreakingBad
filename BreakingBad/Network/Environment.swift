//
//  Environment.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 27/08/2022.
//

import Foundation

public enum Environment: String, CaseIterable {
    case development
    case staging
    case production
}

extension Environment {
    var charactersServiceBaseUrl: String {
        switch self {
        case .development:
            return "https://breakingbadapi.com/api/characters"
        case .staging:
            return "https://breakingbadapi.com/api/characters"
        case .production:
            return "https://breakingbadapi.com/api/characters"
        }
    }
}
