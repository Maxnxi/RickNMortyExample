//
//  LocationsViewModel.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 22/06/2022.
//

import Foundation
import SwiftUI
import Combine


class LocationsViewModel: ObservableObject {

    @Published public private(set) var locations: [ Location ] = []
    @Published public private(set) var showProgressView = false
    
    var currentPage = 1
    private var cancellable: AnyCancellable?
    
    func getLocations(page: Int) {
        showProgressView = true
        cancellable = GetLocationsUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.showProgressView = false
                switch completion {
                case .finished:
                    self.currentPage += 1
                    break
                case .failure:
                    break
                }
            }, receiveValue: { locations in
                self.locations.append(contentsOf: locations)
            })
    }
}
