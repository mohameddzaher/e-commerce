//
//  CustomCorners.swift
//  e-commerce
//
//  Created by Mohamed Zaher on 15/12/2021.
//

import SwiftUI

struct CustomCorners: Shape {
    
    var Corners: UIRectCorner
    var radius: CGFloat
  
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: Corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}


