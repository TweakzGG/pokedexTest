//
//  Pokemon.swift
//  PokedexTest
//
//  Created by Jackson Barnes on 9/5/21.
//

import Foundation

struct PokeAPIResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable{
    let name: String
}

