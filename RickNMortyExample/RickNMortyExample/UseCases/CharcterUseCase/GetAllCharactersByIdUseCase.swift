//
//  GetAllCharactersByIdUseCase.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation
import Combine

class GetAllCharactersByIdUseCase {
    
    private let repository: CharacterRepo
    
    init(repository: CharacterRepo = CharacterRepoImpl()) {
        
        self.repository = repository
    }
    
    func execute(ids: [Int]) -> AnyPublisher<[Character], Error> {
        
        repository.getAllCharactersbyId(ids: ids)
    }
}
