//
//  Episodes.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import SwiftUI

struct Episodes: View {
    
    @StateObject var viewModel: EpisodesViewModel
    
    var body: some View {
        VStack {
            List {
                Section(header: ListHeaderView()) {
                    if viewModel.showProgressView {
                        ProgressviewView()
                    }
                    ForEach(viewModel.episodes) {
                        episode in
                        NavigationLink(destination: EpisodeDetailView(viewModel: EpisodeDetailViewModel(episode: episode))) {
                            ZStack{
                                EpisodeListCellview(viewModel: episode)
                            }
                            
                        }
                        .onAppear {
                            if episode == viewModel.episodes.last {
                                viewModel.getEpisodes(page: viewModel.currentPage)
                            }
                        }
                    }
                }
                .onAppear {
                    if viewModel.episodes.isEmpty {
                        viewModel.getEpisodes(page: 1)
                    }
                }
            }
        }
    }
}

struct Episodes_Previews: PreviewProvider {
    static var previews: some View {
        Episodes(viewModel: EpisodesViewModel())
    }
}
