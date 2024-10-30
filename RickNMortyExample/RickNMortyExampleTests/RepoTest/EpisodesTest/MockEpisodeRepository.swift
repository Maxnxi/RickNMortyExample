//
//  MockEpisodeRepository.swift
//  RickNMortyExampleTests
//
//  Created by Maksim Ponomarev on 25/07/2022.
//

import XCTest
import Combine
@testable import RickNMortyExample

class MockEpisodeRepository: EpisodesRepo {
    
    var isGetEpisodeCalled = false
    var isGetEpisodeDetailCalled = false
    
    func getEpisodes(page: Int) -> AnyPublisher<[Episode], Error> {
        self.isGetEpisodeCalled = true
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getEpisodeDetail(id: Int) -> AnyPublisher<Episode, Error> {
        self.isGetEpisodeDetailCalled = true
        return Just(Episode(id: 1, name: "", episode: "", airDate: "", characters: [""]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    

    

}
