//
//  JSON.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 30/08/2022.
//

import Foundation

struct SwiftUtility {
    
   static func loadJson(filename fileName: String) -> Data {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let dataObj = try Data(contentsOf: url)
                return dataObj
            } catch {
                print("error:\(error)")
            }
        }
        return Data()
    }
    
}
