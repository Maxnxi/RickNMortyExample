//
//  CustomTab.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import SwiftUI

struct CustomTab: View {
    
    @State private var selected = 0
    @State private var scaleKoef: CGFloat = 1.0
    
    var body: some View {
        VStack{
            switch selected {
            case 0:
                CharactersCollectionView(viewModel: CharactersCollectionViewModel())
            case 1:
                Locations()
            case 2:
                Episodes()
            case 3:
                CharactersCollectionViewASC(viewModel: CharactersCollectionViewModel())
                
                //CharactersCollection()
            case 4:
                Text("case 4")
                //CharactersCollection()
            default:
                CharactersCollectionView(viewModel: CharactersCollectionViewModel())
                //CharactersCollection()
            }
            
            
            Spacer(minLength: 30)
            
            ZStack{
                HStack{
                    Button {
                        self.selected = 0
                    } label: {
                        VStack{
                            Image(systemName: "person")
                            Text("Characters")
                                .font(.custom("Avenir", size: 12))
                        }
                    }.foregroundColor(self.selected == 0 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button {
                        self.selected = 1
                    } label: {
                        VStack{
                            Image(systemName: "map")
                            Text("Locations")
                                .font(.custom("Avenir", size: 12 ))
                        }
                    }.foregroundColor(self.selected == 1 ? .black : .gray)
                    
                    Spacer().frame(width: 120)
                    
                    Button {
                        self.selected = 2
                    } label: {
                        Image(systemName: "house")
                    }.foregroundColor(self.selected == 2 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button {
                        self.selected = 3
                    } label: {
                        Image(systemName: "house")
                    }.foregroundColor(self.selected == 3 ? .black : .gray)
                    
                }
                .padding()
                .padding(.horizontal, 12)
                .background(CurvedTabBack())
                
                Button {
                    scaleKoef == 1 ? (scaleKoef = 0.5) : (scaleKoef = 1)
                } label: {
                    Image(systemName: "heart.fill")
                        .renderingMode(.original)
                        .padding(18)
                }
                .background(Color.yellow)
                .clipShape(Circle())
                .scaleEffect(scaleKoef)
                .offset(y: -22)
                .shadow(radius: 5)
            }
        }.background(Color.green.edgesIgnoringSafeArea(.top))
    }
}

struct CustomTab_Previews: PreviewProvider {
    static var previews: some View {
        CustomTab()
    }
}
