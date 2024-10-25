//
//  ProgressviewView.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import SwiftUI

struct ProgressviewView: View {
    var body: some View {

        HStack{
            Spacer()
    
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.green))
    
            Spacer()
        }
    }
}

struct ProgressviewView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressviewView()
    }
}
