//
//  EpisodesRepo.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import Foundation
import Combine

protocol EpisodesRepo {
    func getEpisodes(page: Int) -> AnyPublisher<[Episode], Error>
}
