//
//  Image_Extension.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 20/06/2022.
//

import SwiftUI

extension Image {
    func renderImage(url: URL) -> Self {
        if let image = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: image)!)
                .resizable()
        }
        return self.resizable()
    }
}


