//
//  CharacterDetailView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var character: Character
    
    var body: some View {
        Text("This is info about Character!")
            .navigationTitle("Character Info")
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let character = Character(id: 1, name: "Rick", status: "Alive", species: "", type: "", gender: "", origin: "", location: "", image: "https://rickandmortyapi.com/api/character/avatar/324.jpeg", url: "", episode: ["",""])
            
        CharacterDetailView(character: character)
    }
}
