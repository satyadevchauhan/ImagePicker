//
//  ContentView.swift
//  ImagePicker
//
//  Created by Satyadev Chauhan on 21/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSheet = false
    @StateObject var viewModel = ImagePickerViewModel()
    
    var body: some View {
        VStack(spacing: 32) {
            CustomImageView(image: viewModel.selectedImage)
            Button("Select an Image") {
                showingSheet = true
            }
        }
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(
                title: Text("Select an Image"),
                buttons: [
                    .default(Text("Take Photo"), action: viewModel.takePhoto),
                    .default(Text("Select Photo"), action: viewModel.choosePhoto),
                    .cancel()
                ]
            )
        }
        .fullScreenCover(isPresented: $viewModel.isPresentingImagePicker, content: {
            ImagePickerView(sourceType: viewModel.sourceType, completionHandler: viewModel.didSelectImage)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
