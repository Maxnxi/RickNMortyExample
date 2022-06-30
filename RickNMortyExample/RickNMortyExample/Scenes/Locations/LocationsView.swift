//
//  LocationsView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import SwiftUI

struct LocationsView: View {
    
    @StateObject var viewModel: LocationsViewModel
    
    var body: some View {
        VStack {
            List {
                Section(header: ListHeaderView()) {
                    if viewModel.showProgressView {
                        ProgressView()
                    }
                    ForEach(viewModel.locations) { location in
                        NavigationLink(destination: LocationDetailView(viewModel: LocationDetailViewModel(location: location))) {
                            ZStack {
                                LocationsListCellView(viewModel: location)
                            }
                        }
                        .onAppear() {
                            if location == viewModel.locations.last {
                                viewModel.getLocations(page: viewModel.currentPage)
                            }
                        }
                    }
                }
                .onAppear() {
                    if viewModel.locations.isEmpty {
                        viewModel.getLocations(page: 1)
                    }
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(viewModel: LocationsViewModel())
    }
}
