//
//  JSON.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 30/08/2022.
//

import Foundation

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return data
    }
}
