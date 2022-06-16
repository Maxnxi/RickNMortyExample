//
//  CharactersCollection.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import SwiftUI

struct CharactersCollection: View {
        
    var characters: [Character] = [Character(id: 999_999, name: "", status: "", species: "", type: "", gender: "", origin: "", location: "", image: "", url: "", episode: [""])]
    @Binding var columnsNumber: Int
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0...columnsNumber, id: \.self) { _ in
                        CharacterCell(character: characters[0])
                        //.symbolRenderingMode(.monochrome)
                        
                        
                        
                    }
                    .padding(10)
                }
            }
            .navigationTitle("Characters")
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
}

struct CharactersCollection_Previews: PreviewProvider {
    static var previews: some View {
        CharactersCollection(columnsNumber: .constant(18))
    }
}
