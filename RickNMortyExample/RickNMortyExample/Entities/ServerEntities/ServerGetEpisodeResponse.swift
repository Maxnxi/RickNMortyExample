//
//  ServerGetEpisodeResponse.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation

struct ServerGetEpisodeResponse: Codable {
    
    let id: Int
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]
    
    enum CodingKeys: String, CodingKey {
            case id, name
            case airDate = "air_date"
            case episode, characters
        }
    
    func convertToEntity() -> Episode {
        
        return Episode(id: id,
                       name: name.capitalizingFirstLetter(),
                       episode: episode,
                       airDate: airDate,
                       characters: characters)
    }
}
