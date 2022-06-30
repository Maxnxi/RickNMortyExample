//
//  CharacterRepo.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation
import Combine

protocol CharacterRepo {
    
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error>
    
    func getCharacterDetails(id: Int) -> AnyPublisher<Character, Error>

    func getAllCharactersbyId(ids: [Int]) -> AnyPublisher<[Character], Error>

}
