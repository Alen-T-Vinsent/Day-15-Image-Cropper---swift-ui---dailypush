//
//  CustomImagePicker.swift
//  Day-15-Image Cropping app
//
//  Created by Apple  on 30/12/22.
//

import SwiftUI
import PhotosUI

//MARK: view extension
extension View{
    @ViewBuilder
    func cropImagePicker(options:[Crop],show:Binding<Bool>,croppedImage:Binding<UIImage?>)->some View{
        CustomImagePicker(options: options, show: show, croppedImage: croppedImage) {
            self
        }
    }
}

fileprivate struct CustomImagePicker<Content:View>:View{
    var content:Content
    var options:[Crop]
    @Binding var show:Bool
    @Binding var croppedImage:UIImage?
    init(options:[Crop],show:Binding<Bool>,croppedImage:Binding<UIImage?>,@ViewBuilder content:@escaping ()-> Content){
        self.content = content()
        self._show = show
        self._croppedImage = croppedImage
        self.options = options
        
    }
    
    ///view properties
    @State private var photosItem:PhotosPickerItem?
    
    var body: some View{
        
        content
            .photosPicker(isPresented: $show, selection: $photosItem)
            .onChange(of: photosItem) { newValue in
                //extracting ui image from 
            }
    }
    
}



struct CustomImagePicker_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
