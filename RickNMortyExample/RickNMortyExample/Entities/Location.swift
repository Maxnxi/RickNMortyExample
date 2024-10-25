//
//  Location.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import Foundation

struct Location: Identifiable, Equatable {
    
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
}
