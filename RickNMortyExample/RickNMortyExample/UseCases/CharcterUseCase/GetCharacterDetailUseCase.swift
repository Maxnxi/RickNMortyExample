//
//  GetCharacterDetailUseCase.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation
import Combine

class GetCharacterDetailUseCase {
    
    private let repository: CharacterRepo
    
    init(repository: CharacterRepo = CharacterRepoImpl()) {
        
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Character, Error> {
        
        repository.getCharacterDetails(id: id)
    }
}
