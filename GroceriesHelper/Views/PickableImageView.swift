//
//  SelectableImage.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/20/23.
//

import SwiftUI
import PhotosUI

class PickableImage: ObservableObject {
    @Published var image: UIImage = UIImage()
}

struct PickableImageView: View {
    @EnvironmentObject var pickableImage: PickableImage
    
    @State private var imageUpdated = false
    
    @State private var showDialog = false
    @State private var showSheet = false
    @State private var showPhotoLibrary = false
    
    @State var selectedPhoto: PhotosPickerItem? = nil
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Button(action: {
                showDialog = true
            }, label: {
                if imageUpdated {
                    Image(uiImage: pickableImage.image)
                        .roundedImage()
                } else {
                    Image(systemName: "camera")
                        .roundedImage()
                }
            }).confirmationDialog("Pick a source", 
                                  isPresented: $showDialog) {
                Button {
                    showSheet = true
                } label: {
                    Label("Camera", systemImage: "camera")
                }
                
                Button {
                    showPhotoLibrary.toggle()
                } label: {
                    Label("Gallery", systemImage: "photo.artframe")
                }
            } message: {
                Text("Pick a source")
            }.photosPicker(isPresented: $showPhotoLibrary,
                           selection: $selectedPhoto,
                           matching: .any(of: [.images, .not(.livePhotos)]))
            .onChange(of: selectedPhoto) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self), 
                        let galleryImage = UIImage(data: data) {
                        pickableImage.image = galleryImage
                        imageUpdated = true
                    }
                }
            }
            
            Image(systemName: "plus")
                .foregroundColor(.white)
                .background(Color.gray)
                .clipShape(Circle())
        }.sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .camera,
                        selectedImage: $pickableImage.image,
                        imageUpdated: $imageUpdated)
        }
    }
}

#Preview {
    PickableImageView().environmentObject(PickableImage())
}
