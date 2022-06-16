//
//  DetailCharacterView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import SwiftUI

struct DetailCharacterView: View {
    var body: some View {
        Text("This is info about Character!")
            .navigationTitle("Character Info")
    }
}

struct DetailCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCharacterView()
    }
}
