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
        NavigationLink {
            CharacterDetailView(character: character)
        } label: {
            ZStack {
                VStack{
                    KFImage(URL(string: character.image))
                    //Image("")
                    //    .renderImage(url: URL(string: character.image)!)
                        
                       .resizable()
                        .frame(width: imageSize, height: imageSize, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        .shadow(color: .gray, radius: 5, x: 0, y: -5)
                       
                        
                    Text(character.name)
                        .lineLimit(2)
                        .scaledToFit()
                        .foregroundColor(Color.black)
                    Text(character.status)
                        .lineLimit(1)
                        .scaledToFit()
                        .foregroundColor(character.status == "Alive" ? Color.black : Color.red)
                }
                
                .padding(10)
                //.background(Color.init(Color(#colorLiteral(red: 0.292, green: 0.081, blue: 0.6, alpha: 255)) as! CGColor))
                .background(Color(#colorLiteral(red: 0.292, green: 0.081, blue: 0.6, alpha: 255)))
                .
            }
        }
        
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        
        let character = Character(id: 1, name: "Rick", status: "Alive", species: "", type: "", gender: "", origin: "", location: "", image: "https://rickandmortyapi.com/api/character/avatar/324.jpeg", url: "", episode: ["",""])
        
        CharacterCell(character: character)
    }
}
