//
//  EpisodeListCellview.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 28/06/2022.
//

import SwiftUI

struct EpisodeListCellview: View {
    var viewModel: Episode
     
     var body: some View {
         
         VStack(alignment: .leading, spacing: 10) {
          Spacer()
             Text(viewModel.name)
                 .foregroundColor(Color.black)
             VStack(alignment: .leading) {
                 Text(viewModel.episode)
                 Text("Air Date : \(viewModel.airDate)")
             }
             .font(.footnote)
             .foregroundColor(Color.gray)
             .background(Color.blue)
             Spacer()
         }
         
     }
}

struct EpisodeListCellview_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeListCellview(viewModel: Episode(id: 1, name: "AAA", episode: "BBB", airDate: "CCC", characters: ["Simple Dimple"]))
    }
}
