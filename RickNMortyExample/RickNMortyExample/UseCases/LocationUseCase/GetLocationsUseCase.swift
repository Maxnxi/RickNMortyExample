//
//  GetLocationsUseCase.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 22/06/2022.
//

import Foundation
import Combine

class GetLocationsUseCase {
    
    private let repository: LocationRepository
    
    init(repository: LocationRepository = LocationRepoImpl()) {
        self.repository = repository
    }
    
    func execute(page: Int) -> AnyPublisher<[Location],Error> {
        repository.getLocation(page: page)
    }
}
