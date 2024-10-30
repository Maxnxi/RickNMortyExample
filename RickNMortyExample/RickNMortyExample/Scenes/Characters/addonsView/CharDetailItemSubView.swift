//
//  CharDetailItemSubView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 27/06/2022.
//

import SwiftUI

struct CharDetailItemSubView: View {
    var title: String
    var value: String
    
    init(title: String, value: String) {
        
        self.title = title
        self.value = value
    }
    
    var body: some View {
        
        HStack {
            Text(title)
                .foregroundColor(Color.blue)
                .font(.footnote)
            
            Spacer()
            
            VStack {
                Text(value)
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct CharDetailItemSubView_Previews: PreviewProvider {
    static var previews: some View {
        CharDetailItemSubView(title: "Title", value: "Value")    }
}
