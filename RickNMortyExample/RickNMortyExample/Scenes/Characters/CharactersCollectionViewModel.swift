//
//  CharactersCollectionViewModel.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation
import SwiftUI
import Combine

class CharactersCollectionViewModel: ObservableObject {
    
    @Published private(set) var characters: [Character] = []
    @Published private(set) var showProgressView = false
    
    var currentPage = 1
    
    private var cancellable: AnyCancellable?
    
    
    func getAllCharacters(page: Int) {
        showProgressView = true
        
        cancellable = GetAllCharactersUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.showProgressView = false
                switch completion {
                case .finished:
                    self?.currentPage += 1
                    break
                case .failure:
                    break
                }
            }, receiveValue: { (characters: [Character]) in
                self.characters.append(contentsOf: characters)
            })
    }

}


