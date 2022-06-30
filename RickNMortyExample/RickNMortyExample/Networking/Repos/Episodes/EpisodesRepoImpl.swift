//
//  EpisodesRepoImpl.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 28/06/2022.
//

import Foundation
import Combine

class EpisodesRepoImpl: EpisodesRepo {
    private let remoteDataSource: EpisodeRemoteDataSource
    
    init(remoteDataSource: EpisodeRemoteDataSource = EpisodeRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getEpisodes(page: Int) -> AnyPublisher<[Episode], Error> {
        return remoteDataSource.getEpisodes(page: page).map {
            serverEpisode -> [Episode] in
            var episodes: [Episode] = []
            for serverEpisod in serverEpisode.results {
                let episode = serverEpisod.convertToEntity()
                episodes.append(episode)
            }
            return episodes
        }
        .map({ $0 })
        .eraseToAnyPublisher()
    }
    
    func getEpisodeDetail(id: Int) -> AnyPublisher<Episode, Error> {
        return remoteDataSource.getEpisodeDetail(id: id).map {
            serverEpisode -> Episode in
            let episode = serverEpisode.results.convertToEntity()
            return episode
        }
        .mapError( { $0 })
        .eraseToAnyPublisher()
    }
    
}
