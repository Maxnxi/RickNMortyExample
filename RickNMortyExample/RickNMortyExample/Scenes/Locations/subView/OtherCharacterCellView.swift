//
//  OtherCharacterCellView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 27/06/2022.
//

import SwiftUI

struct OtherCharacterCellView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    var image: String
    var name: String
    var titleA: String
    var subtitleA: String
    var titleB: String
    var subtitleB: String
    
    let imageSize: CGFloat = 60
    let cornerRadius: CGFloat = 50
    
    init(image: String, name: String, titleA: String, subtitleA: String, titleB: String, subtitleB: String) {
        
        self.image = image
        self.name = name
        self.titleA = titleA
        self.subtitleA = subtitleA
        self.titleB = titleB
        self.subtitleB = subtitleB
    }
    
    var body: some View {
        
        HStack{
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            Text(name)
                .foregroundColor(Color.black)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                
                Text(titleA)
                
                Text(subtitleA)
                
                Divider().frame(maxWidth: 40)
                
                Text(titleB)
                
                Text(subtitleB)
            }
            .font(.footnote)
            .foregroundColor(Color.gray
            
            )
        }
    }
}

struct OtherCharacterCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OtherCharacterCellView(image: "https://rickandmortyapi.com/api/character/avatar/324.jpeg",
                               name: "name",
                               titleA: "Title A",
                               subtitleA: "Subtitle A",
                               titleB: "Title B",
                               subtitleB: "Subtitle B")
    }
}
