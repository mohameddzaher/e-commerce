//
//  Detail.swift
//  e-commerce
//
//  Created by Mohamed Zaher on 10/12/2021.
//

import SwiftUI

struct Detail: View {
    @Binding var selectedItem: Item
    @Binding var show: Bool
    
    var animation: Namespace.ID
    
    @State var loadContent = false
    
    var body: some View {
        
        
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(),
                   content: {
            
            VStack{
                
                HStack (spacing: 25) {
                    
                    Button(action: {
                        
                        // Closing View...
                        
                        withAnimation(.spring()) {show.toggle()}
                    }) {
                        
                       Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        
                        Image(systemName: "magnifyingglass")
                             .font(.title)
                             .foregroundColor(.black)
                    }
                    
                    Button(action: {}) {
                        
                        Image(systemName: "bag")
                             .font(.title)
                             .foregroundColor(.black)
                        
                             .padding()
                    }
                }
            
                
                VStack {
                    
                    Image(selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    // Since id is common...
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .padding()
                    
                    Text(selectedItem.title)
                        .font(.title)
                        
                        .foregroundColor(.black)
                        .font(.system(size: 10))
                    
                    Text(selectedItem.subTitle)
                        .foregroundColor(.gray)
                        .padding(.top,4)
                        .font(.system(size: 15))
                    
                    HStack{
                        
                        Text(selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                        
                     
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(
                    Color(selectedItem.image)
                        .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
                )
                .cornerRadius(15)
              
                
                // Delay loading the content for smooth animation...
                
                VStack{
                    
                    VStack (alignment: .leading,spacing: 3) {
                        
                        Text("Exclusive offer")
                           
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            
                        
                        Text("Shirt  + SweatPant for $150 (it's 50% off")
                            .foregroundColor(.white)
                            .font(.system(size: 10))
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                    .background(.brown)
                    .cornerRadius(20)
                    
                    
                    
                    Button(action: {}) {
                        
                        Text("Try Frame In 3D")
                            .foregroundColor(.black)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black,lineWidth: 1)
                            )
                    }
                    
                    Button(action: {}) {
                        
                        Text("ADD TO CART")
                            .foregroundColor(.white)
                            
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color.black)
                            .cornerRadius(15)
                            .font(.system(size: 15))
                    }
                    .padding(.vertical)
                }
                .padding([.horizontal,.bottom])
                .frame( height: loadContent ? nil : 0)
                .opacity(loadContent ? 1 : 0)
                
                Spacer()
            }
        }
        )
        .onAppear {
            
            withAnimation(Animation.spring().delay(0.45)) {
                
                loadContent.toggle()
            }
        }
    }
}
