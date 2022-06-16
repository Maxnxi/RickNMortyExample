//
//  CharacterCell.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import SwiftUI

struct CharacterCell: View {
    var character: Character
    
    var body: some View {
        NavigationLink {
            DetailCharacterView()
        } label: {
            ZStack {
                VStack{
                    Image(character.image)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    Text("Name: \(character.name)")
                        .lineLimit(2)
                        .scaledToFit()
                    Text("Status: \(character.status)")
                        .lineLimit(1)
                        .scaledToFit()
                }
                .padding(10)
                .background(Color.yellow)
            }
        }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: Character(id: 999_999, name: "Test Name", status: "Alive", species: "Human", type: "Do not know", gender: "Male", origin: "", location: "", image: "person", url: "", episode: ["",""]))
    }
}
