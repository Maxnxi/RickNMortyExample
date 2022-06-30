//
//  LocationDetSubView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 27/06/2022.
//

import SwiftUI

struct LocationDetSubView: View {
        
    var titleIcon: String
    var title: String
    var value: String
    
    init(titleIcon: String, title: String, value: String) {
        
        self.titleIcon = titleIcon
        self.title = title
        self.value = value
    }
    
    var body: some View {
        
        HStack {
            
            Text(titleIcon)
                .font(.footnote)
            
            Text(title)
                .foregroundColor(Color.blue)
                .font(.footnote)
            
            Spacer()
            
            VStack {
                
                Text(value)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct OtherDetailItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        LocationDetSubView(titleIcon: "📺", title: "Title", value: "Value")
    }
}
