//
//  Home.swift
//  Day-15-Image Cropping app
//
//  Created by Apple  on 30/12/22.
//

import SwiftUI

struct Home: View {
    //view properties
    @State private var showPicker:Bool = false
    @State private var croppedImage:UIImage?
    
    var body: some View {
        NavigationStack{
            VStack{
                if let croppedImage{
                    Image(uiImage: croppedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:300,height: 400)
                }else{
                    Text("No image selected")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Crop Image Picker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showPicker.toggle()
                    } label: {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.callout)
                    }
                    .tint(.black)

                }
            }
            .cropImagePicker(options: [.circle,.square,.rectangle], show: $showPicker, croppedImage: $croppedImage)
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
