//
//  LocationRepoImpl.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 22/06/2022.
//

import Foundation
import Combine

class LocationRepoImpl: LocationRepository {
    
    private let remoteDataSource: LocationRemoteDataSource
    
    init(remoteDataSource: LocationRemoteDataSource = LocationRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getLocation(page: Int) -> AnyPublisher<[Location], Error> {
        return remoteDataSource.getLocation(page: page).map {
            serverLocation -> [Location] in
            var locations: [Location] = []
            for servLocation in serverLocation.results {
                let location = servLocation.convertToEntity()
                locations.append(location)
            }
            return locations
        }
        .mapError({$0})
        .eraseToAnyPublisher()
    }
    
    func getLocationDetail(id: Int) -> AnyPublisher<Location, Error> {
        return remoteDataSource.getLocationDetail(id: id).map {
            serverLocation -> Location in
            let location = serverLocation.results.convertToEntity()
            return location
        }
        .mapError({$0})
        .eraseToAnyPublisher()
    }
    
}
