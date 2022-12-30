//
//  Crop.swift
//  Day-15-Image Cropping app
//
//  Created by Apple  on 30/12/22.
//

import SwiftUI

//MARK: Crop config
enum Crop:Equatable{//The crop image view's shape type and size are defined
    case circle
    case rectangle
    case square
    case custom(CGSize)
    
    func name()->String{//used to display button on action sheet
        switch self {
        case .circle:
            return "Circle"
        case .rectangle:
            return "Rectangle"
        case .square:
            return "Square"
        case .custom(let cGSize):
            return "Custom \(Int(cGSize.width))X\(Int(cGSize.height))"
        }
    }
    
    func size()->CGSize{//you can also define custom sizes for circle , rectangle , and square by doing the same as custom size. These sizes represent the crop view size
        switch self {
        case .circle:
            return .init(width:300,height:300)
        case .rectangle:
            return .init(width:300,height:500)
        case .square:
            return .init(width: 300, height: 300)
        case .custom(let cGSize):
            return cGSize
        }
    }
}

