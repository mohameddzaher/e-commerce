//
//  TabButton.swift
//  e-commerce
//
//  Created by Mohamed Zaher on 10/12/2021.
//

import SwiftUI

struct TabButton: View {
    
    
    var title: String
    @Binding var selected: String
    
    var animation: Namespace.ID
    
    var body: some View {Button(action: {
        
        }) {
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? .white :
                                        .black)
                .padding(.vertical,10)
                .padding(.horizontal, selected == title ? 20 :
                0)
                .background(
                    
                    //For Slide Effect Animation...
                    
                    ZStack{
                        
                        if selected == title{
                            
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        }
    }
}

