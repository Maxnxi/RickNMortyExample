//
//  ServerBaseArrayResponse.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation

struct ServerBaseArrayResponse<T: Codable>: Codable {
    
    let results: [T]
}
