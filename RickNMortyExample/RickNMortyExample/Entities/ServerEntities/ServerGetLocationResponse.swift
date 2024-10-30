//
//  ServerGetLocationResponse.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation

struct ServerGetLocationResponse: Codable {
    
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
    
    func convertToEntity() -> Location {
        
        return Location(id: id,
                        name: name.capitalizingFirstLetter(),
                        type: type.capitalizingFirstLetter(),
                        residents: residents,
                        dimension: dimension.capitalizingFirstLetter())
    }
}
