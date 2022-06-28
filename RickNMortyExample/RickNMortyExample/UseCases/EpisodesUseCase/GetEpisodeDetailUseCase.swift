//
//  GetEpisodeDetailUseCase.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 28/06/2022.
//

import Foundation
import Combine

class GetEpisodeDetailUseCase {
    private let repository: EpisodesRepo
    
    init(repository: EpisodesRepo = EpisodesRepo) {
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Episode, Error> {
        repository.getEpisodeDetail(id: id)
    }
}
