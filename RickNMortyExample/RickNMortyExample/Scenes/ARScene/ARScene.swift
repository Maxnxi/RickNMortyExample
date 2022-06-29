//
//  ARScene.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 28/06/2022.
//

import SwiftUI
import ARKit
import SceneKit

struct ARViewContainer: UIViewRepresentable {
    let arDelegate: ARDelegate

    func makeUIView(context: Context) -> some UIView {
        let arView = ARSCNView(frame: .zero)
        arDelegate.setARView(arView)
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

struct ARScene: View {
    
    @ObservedObject var arDelegate = ARDelegate()
    
    var body: some View {
        GeometryReader {_ in
            ZStack {
             ARViewContainer(arDelegate: arDelegate)
                VStack {
                    Spacer()
                    Text(arDelegate.message)
                        .foregroundColor(Color.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 20)
                        .background(Color.secondary)
                }
            }
            .edgesIgnoringSafeArea(.all)
        } // GeometryReader
        
    }
}

struct ARScene_Previews: PreviewProvider {
    static var previews: some View {
        ARScene()
    }
}
