//
//  CharactersCollection.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import SwiftUI

struct CharactersCollectionView: View {
        
    @StateObject var viewModel: CharactersCollectionViewModel
    //@State var cellsNumber: Int = viewModel.characters.count
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            ScrollView {
                
                
                LazyVGrid(columns: columns) {
                    Section {
                        ForEach(viewModel.characters) { character in
                            
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                CharacterCell(character: character)
                            }
                            .onAppear() {
                                if character == viewModel.characters.last {
                                    viewModel.getAllCharacters(page: viewModel.currentPage)
                                }
                            }
                        }
                        .padding(10)
                    }
                    
                }
                .onAppear() {
                    if viewModel.characters.isEmpty {
                        viewModel.getAllCharacters(page: 1) // 1
                    }
                }
            }
           
            .navigationTitle("Characters - \(viewModel.characters.count)")
            .toolbar {
                HStack{
                    Button {
                        //
                    } label: {
                        Text("Filter")
                    }
                    Button {
                        //
                    } label: {
                        Text("Sort")
                    }
                }
            }
        }
        //.preferredColorScheme(.dark)
    }
}

struct CharactersCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersCollectionView(viewModel: CharactersCollectionViewModel())
    }
}
