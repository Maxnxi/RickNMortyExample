//
//  LocationsViewModel.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 22/06/2022.
//

import Foundation
import SwiftUI
import Combine

protocol LocationsViewModel {
    func getLocations(page: Int)
}

class LocationsViewModelImpl:LocationsViewModel, ObservableObject {

    @Published public private(set) var locations: [ Location ] = []
    @Published public private(set) var showProgressView = false
    
    var currentPage = 1
    private var cancellable: AnyCancellable?
    
    func getLocations(page: Int) {
        showProgressView = true
        cancellable = Get
    }
    
    
}
