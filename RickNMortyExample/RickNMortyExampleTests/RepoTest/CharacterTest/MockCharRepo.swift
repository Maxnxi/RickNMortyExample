//
//  MockCharRepo.swift
//  RickNMortyExampleTests
//
//  Created by Maksim Ponomarev on 21/06/2022.
//

import XCTest
import Combine
@testable import RickNMortyExample

class MockCharRepo: CharacterRepo {
    
    var isGetAllCharactersCalled = false
    var isGetCharacterDetailCalled = false
    var isgetAllCharactersByIdCalled = false
    
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        self.isGetAllCharactersCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getCharacterDetails(id: Int) -> AnyPublisher<Character, Error> {
        self.isGetCharacterDetailCalled = true
        
        return Just(Character(id: 1, name: "", status: "", species: "", type: "", gender: "", origin: "", location: "", image: "", url: "", episode: [""]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getAllCharactersbyId(ids: [Int]) -> AnyPublisher<[Character], Error> {
        self.isgetAllCharactersByIdCalled = true
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    
}
