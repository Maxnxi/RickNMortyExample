//
//  Episode.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import Foundation

struct Episode: Identifiable, Equatable {
    
    let id: Int
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]
    
}
