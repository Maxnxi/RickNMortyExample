//
//  LocationDetailView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 27/06/2022.
//

import SwiftUI

struct LocationDetailView: View {
    
    @StateObject var viewModel: LocationDetailViewModel
    
    var body: some View {
        
        VStack {
            Text(viewModel.location.name)
                .font(.title)
                .foregroundColor(Color.black)
            Divider().frame(maxWidth: 240)
            Spacer(minLength: 10)
            VStack(spacing: 20) {
                LocationDetSubView(titleIcon: viewModel.typeIcon,
                                    title: viewModel.type,
                                    value: viewModel.location.type)
                    .frame(maxWidth:.infinity)
                
                LocationDetSubView(titleIcon: viewModel.dimensionIcon,
                                    title: viewModel.dimension,
                                    value: viewModel.location.dimension)
                    .frame(maxWidth:.infinity)
            }
            .padding()
            
            List {
                Section(header: Text(viewModel.residents)) {
                    if viewModel.showProgressView {
                        ProgressviewView()
                    }
                    if viewModel.noResidents {
                        VStack(spacing: 5) {
                            Image(systemName: "exclamationmark.triangle")
                            Text("“Wubba lubba dub dub!”")
                                .font(.footnote)
                            Text("There are no residents in this \(viewModel.location.type)")
                                .font(.footnote)
                        } .foregroundColor(Color.black)
                    } else {
                        ForEach(viewModel.characters, id: \.self ) {
                            character in
                            NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                                OtherCharacterCellView(image: character.image,
                                                       name: character.name,
                                                       titleA: viewModel.bornIn,
                                                       subtitleA: character.origin,
                                                       titleB: viewModel.lastSeen,
                                                       subtitleB: character.location)
                                    .frame(maxWidth:.infinity)
                                    .padding(5)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth:.infinity)
            .listStyle(.grouped)
        }
        .onAppear(){
            viewModel.getLocationDetail()
        }
    }
}

struct LocationDetailView_Preview: PreviewProvider {
    static var previews: some View {
        
        LocationDetailView(viewModel: LocationDetailViewModel(location: Location(id: 1, name: "Earty", type: "Planet", residents: ["yes"], dimension: "dimension")))
    }
}
