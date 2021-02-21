//
//  CustomImageView.swift
//  ImagePicker
//
//  Created by Satyadev Chauhan on 21/02/21.
//

import SwiftUI

struct CustomImageView: View {
    
    let image: UIImage?
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
        }
        else {
            Text("No image selected.")
        }
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(image: nil)
        CustomImageView(image: UIImage(named: "bg"))
    }
}
