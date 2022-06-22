//
//  CharacterCell.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//
import Kingfisher
import SwiftUI

struct CharacterCell: View {
    var character: Character
    let imageSize: CGFloat = 100
    let cornerRadius: CGFloat = 35
    
    var body: some View {
        ZStack {
            NavigationLink {
            CharacterDetailView(character: character)
        } label: {
            ZStack {
                VStack{
                    KFImage(URL(string: character.image))
                       .resizable()
                        .frame(width: imageSize, height: imageSize, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        .shadow(color: .gray, radius: 5, x: 0, y: -5)
                        
                    Text(character.name)
                        .font(.custom(Constants.fontAvenir, size: 14))
                        .lineLimit(2)
                        .scaledToFit()
                        .foregroundColor(Color.white)
                    Text(character.status)
                        .font(.custom(Constants.fontAvenir, size: 14))
                        .lineLimit(1)
                        .scaledToFit()
                        .foregroundColor(character.status == "Alive" ? Color.white : Color.red)
                }
                
                .padding(10)
                .background(Color(Constants.color1LightGray))
                .clipShape(RoundedRectangle(cornerRadius: 35))
                .contentShape(RoundedRectangle(cornerRadius: 35))
                
            }
        }
        }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        
        let character = Character(id: 1,
                                  name: "Rick",
                                  status: "Alive",
                                  species: "",
                                  type: "",
                                  gender: "",
                                  origin: "",
                                  location: "",
                                  image: "https://rickandmortyapi.com/api/character/avatar/324.jpeg",
                                  url: "",
                                  episode: ["",""])
        
        CharacterCell(character: character)
    }
}
