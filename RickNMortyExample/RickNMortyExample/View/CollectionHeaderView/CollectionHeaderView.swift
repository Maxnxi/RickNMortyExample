//
//  CollectionHeaderView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import SwiftUI

struct CollectionHeaderView: View {
    var body: some View {
        HStack {
            
            Image(systemName: "eyes")
            Text("Click on any cell for further information")
        }
        .font(.system(size: 10))
    }
}

struct CollectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionHeaderView()
    }
}
