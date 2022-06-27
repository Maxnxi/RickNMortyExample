//
//  GetLocationDetailUseCase.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 27/06/2022.
//

import Foundation
import Combine

class GetLocationDetailUseCase {
    
    private let repository: LocationRepository
    
    init(repository: LocationRepository = LocationRepoImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Location, Error> {
        repository.getLocationDetail(id: id)
    }
}
