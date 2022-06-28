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
    typealias UIViewType = ARView
    
    //typealias UIViewType = ARView
    func makeUIView(context: UIViewRepresentableContext<ARViewContainer>) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        let boxAnchor = try! Experience.loadBox()
        arView.scene.anchors.append(boxAnchor)
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct ARScene: View {
    var body: some View {
        GeometryReader {_ in
            VStack {
                //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                     ARViewContainer().edgesIgnoringSafeArea(.all)
                
            }//VStack
        } // GeometryReader
        
    }
}

struct ARScene_Previews: PreviewProvider {
    static var previews: some View {
        ARScene()
    }
}
