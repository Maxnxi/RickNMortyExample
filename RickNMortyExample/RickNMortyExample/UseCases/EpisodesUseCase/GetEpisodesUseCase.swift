//
//  GetEpisodesUseCase.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 28/06/2022.
//

import Foundation
import Combine

class GetEpisodesUseCase {
    private let repository: EpisodesRepo
    
    init(repository: EpisodesRepo = EpisodesRepoImpl()) {
        self.repository = repository
    }
    
    func execute(page: Int) -> AnyPublisher<[Episode],Error> {
        repository.getEpisodes(page: page)
    }
}
