//
//  CharactersCollectionViewASC.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 21/06/2022.
//

import ASCollectionView
import SwiftUI

struct CharactersCollectionViewASC: View {
        
    @StateObject var viewModel: CharactersCollectionViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
                ASCollectionView(data: viewModel.characters) { character, context in
                    CharacterCell(character: character)
                        .onAppear(){
                            if character == viewModel.characters.last {
                                viewModel.getAllCharacters(page: viewModel.currentPage)
                            }
                        }
                }
                .layout{
                    ASCollectionLayoutSection.grid(
                        layoutMode: .fixedNumberOfColumns(3),
                        itemSpacing: 0,
                        lineSpacing: 16)
                }
            .onAppear() {
                print("On appear 1 works")
                if viewModel.characters.isEmpty {
                    viewModel.getAllCharacters(page: 1) // 1
                }
            }
           
            .navigationTitle("Characters ASC")
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
}

struct CharactersCollectionViewASC_Previews: PreviewProvider {
    static var previews: some View {
        CharactersCollectionViewASC(viewModel: CharactersCollectionViewModel())
    }
}
