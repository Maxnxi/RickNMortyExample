//
//  ListHeader.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 27/06/2022.
//

import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        
        HStack {
            Image(systemName: "eyes")
            Text("Click on any cell")
        }
        .font(.system(size: 10))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ListHeaderView()
    }
}
