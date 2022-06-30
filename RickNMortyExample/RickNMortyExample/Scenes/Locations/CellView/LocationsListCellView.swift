//
//  LocationsListCellView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 27/06/2022.
//

import SwiftUI

struct LocationsListCellView: View {
    
   var viewModel: Location
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
         Spacer()
            Text(viewModel.name)
                .foregroundColor(Color.black)
            VStack(alignment: .leading) {
                Text(viewModel.type)
                Text(viewModel.dimension == "Unknown" ? "Unknown" : "Dimension: \(viewModel.dimension)")
            }
            .font(.footnote)
            .foregroundColor(Color.gray)
            Spacer()
        }
        
    }
}

struct LocationsListCellView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListCellView(viewModel: Location(id: 1, name: "Earth", type: "Planet", residents: [""], dimension: "DimensionA"))
    }
}
