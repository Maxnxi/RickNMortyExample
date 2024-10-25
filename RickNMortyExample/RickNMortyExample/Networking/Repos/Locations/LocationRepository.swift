//
//  LocationRepository.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 22/06/2022.
//

import Foundation
import Combine

protocol LocationRepository {
    
    func getLocation(page: Int) -> AnyPublisher<[Location], Error>
    func getLocationDetail(id: Int) -> AnyPublisher<Location, Error>
}
