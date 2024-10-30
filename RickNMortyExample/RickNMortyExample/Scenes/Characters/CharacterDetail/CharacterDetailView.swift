//
//  CharacterDetailView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.character.image))
                .resizable()
                .frame(width: viewModel.imageSize, height: viewModel.imageSize, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius))
                .shadow(color: .gray, radius: 5, x: 0, y: -5)
            
            Text(viewModel.character.name)
                .font(.title)
                .foregroundColor(Color.black)
            
            Divider().frame(maxWidth: 240)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 10) {
                if viewModel.showProgressView {
                    ProgressviewView()
                }
                CharDetailItemSubView(title: viewModel.gender,
                                      value: viewModel.character.gender)
                .frame(maxWidth: .infinity)
                CharDetailItemSubView(title: viewModel.species,
                                      value: viewModel.character.species)
                .frame(maxWidth: .infinity)
                CharDetailItemSubView(title: viewModel.status,
                                      value: viewModel.character.status)
                .frame(maxWidth: .infinity)
                CharDetailItemSubView(title: viewModel.origin,
                                      value: viewModel.character.origin)
                .frame(maxWidth: .infinity)
                CharDetailItemSubView(title: viewModel.location,
                                      value: viewModel.character.location)
                .frame(maxWidth: .infinity)
                Spacer()
            }
            .padding()
        }
        .onAppear{
            viewModel.getCharacterDetail()
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let character = Character(id: 1, name: "Rick", status: "Alive", species: "", type: "", gender: "", origin: "", location: "", image: "https://rickandmortyapi.com/api/character/avatar/324.jpeg", url: "", episode: ["",""])
            
        CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))
    }
}
