//
//  CharacterDetailViewModel.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import Foundation
import Combine
import SwiftUI

class CharacterDetailViewModel: ObservableObject {

    @Published public private(set) var character: Character
    @Published public private(set) var showProgressView: Bool = false
    
    let location: String
    let gender: String
    let status: String
    let origin: String
    let species: String
    
    let unknownInfo: String
    let unknownString: String
    
    let imageSize: CGFloat = 90
    let cornerRadius: CGFloat = 50
    
    private var cancellable: AnyCancellable?
    
    init(character: Character) {
        self.character = character
        location = "Currently living in"
        gender = "Gender"
        status = "Current status"
        origin = "Born in"
        species = "Species"
        unknownInfo = "unknown"
        unknownString = "Unknown"
    }
    
    func getCharacterDetail() {
        showProgressView = true
        cancellable = GetCharacterDetailUseCase().execute(id: character.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.showProgressView = false
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { character in
                self.character = character
            })
    }
    
}
