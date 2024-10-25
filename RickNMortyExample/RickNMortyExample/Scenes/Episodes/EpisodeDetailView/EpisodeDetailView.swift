//
//  EpisodeDetailView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 28/06/2022.
//

import SwiftUI

struct EpisodeDetailView: View {
    
    @StateObject var viewModel: EpisodeDetailViewModel
        
    var body: some View {
        
        VStack {
            
            Text(viewModel.episode.name)
                .font(.title)
                .foregroundColor(Color.black)
            
            Divider().frame(maxWidth: 240)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 20) {
                
                LocationDetSubView(titleIcon: viewModel.episodeSeasonIcon,
                                    title: viewModel.episodeSeason,
                                    value: viewModel.episode.episode)
                    .frame(maxWidth:.infinity)
                
                LocationDetSubView(titleIcon: viewModel.airDateIcon,
                                    title: viewModel.airDate,
                                    value: viewModel.episode.airDate)
                    .frame(maxWidth:.infinity)
                
                LocationDetSubView(titleIcon: viewModel.characterStarringIcon,
                                    title: viewModel.characterStarring,
                                    value: "\(viewModel.characters.count)")
                    .frame(maxWidth:.infinity)
            }
            .padding()
            
            List {
                
                Section(header: Text(viewModel.charactersTitle)) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressviewView()
                    }
                    
                    ForEach(viewModel.characters, id: \.self){ character in
                        
                        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                            
                            OtherCharacterCellView(image: character.image,
                                                   name: character.name,
                                                   titleA: viewModel.episodeDetail,
                                                   subtitleA: "\(character.episode.count) \(viewModel.episodeString)",
                                                   titleB: viewModel.currentStatus,
                                                   subtitleB: character.status)
                                .frame(maxWidth:.infinity)
                                .padding(5)
                        }
                    }
                }
            }
            .frame(maxWidth:.infinity)
            .listStyle(.grouped)
        }
        .onAppear {
            
            viewModel.getEpisodeDetail()
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let episode = Episode(id: 1,
                              name: "Pilot",
                              episode: "S01E01",
                              airDate: "December 2, 2013",
                              characters: ["2", "35"])
        
        EpisodeDetailView(viewModel: EpisodeDetailViewModel(episode: episode))
    }
}
