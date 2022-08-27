//
//  Character.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 27/08/2022.
//

import Foundation

struct Character: Codable {
    let charId: Int
    let name: String
    let birthday: String?
    let occupation: [String]
    let img: String
    let status: Status
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: Category
    let betterCallSaulAppearance: [Int]
}

enum Category: String, Codable {
    case betterCallSaul = "Better Call Saul"
    case breakingBad = "Breaking Bad"
    case breakingBadBetterCallSaul = "Breaking Bad, Better Call Saul"
}

enum Status: String, Codable {
    case alive = "Alive"
    case deceased = "Deceased"
    case presumedDead = "Presumed dead"
    case unknown = "Unknown"
}

typealias Characters = [Character]
