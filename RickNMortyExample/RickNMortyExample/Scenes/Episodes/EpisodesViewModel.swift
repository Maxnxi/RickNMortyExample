//
//  EpisodesViewModel.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 28/06/2022.
//

import Foundation
import Combine

class EpisodesViewModel: ObservableObject {
    @Published public private(set) var episodes: [Episode] = []
    @Published public private(set) var showProgressView = false
    
    var currentPage = 1
    private var cancellable: AnyCancellable?
    
    func getEpisodes(page:Int) {
        showProgressView = true
        cancellable = GetEpisodesUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.currentPage += 1
                    break
                case .failure:
                    break
                }
            }, receiveValue: { (episodes: [Episode]) in
                self.episodes.append(contentsOf: episodes)
            })
    }
}
