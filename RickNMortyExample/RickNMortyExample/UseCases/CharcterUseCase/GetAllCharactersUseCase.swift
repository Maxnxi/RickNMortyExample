//
//  GetAllCharactersUseCase.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation
import Combine

class GetAllCharactersUseCase {
    
    private let repository: CharacterRepo
    
    init(repository: CharacterRepo = CharacterRepoImpl()) {
        self.repository = repository
    }
    
    func execute(page: Int) -> AnyPublisher<[Character], Error> {
        
        repository.getAllCharacters(page: page)
    }
}
