//
//  CharacterRepoImpl.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation
import Combine

class CharacterRepoImpl: CharacterRepo {
   
    private let remoteDataSource: CharacterRemoteDataSource
    
    init(remoteDataSource: CharacterRemoteDataSource = CharacterRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        return remoteDataSource.getAllCharacters(page: page).map {
            serverCharacter -> [Character] in
            var characters: [Character] = []
            for element in serverCharacter.results {
                let character = element.convertToEntity()
                characters.append(character)
            }
            return characters
        }
        .mapError { $0 }
        .eraseToAnyPublisher()
    }
    
    func getCharacterDetails(id: Int) -> AnyPublisher<Character, Error> {
        return remoteDataSource.getCharacterDetail(id: id).map {
            serverCharacter -> Character in
            let character = serverCharacter.convertToEntity()
            return character
        }
        .mapError { $0 }
        .eraseToAnyPublisher()
    }
    
    func getAllCharactersbyId(ids: [Int]) -> AnyPublisher<[Character], Error> {
        
        let publishers = ids.map(getCharacterDetails(id:))
        return Publishers.MergeMany(publishers)
            .collect()
            .eraseToAnyPublisher()
    }
    
}
