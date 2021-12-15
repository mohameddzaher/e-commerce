//
//  OnBoardingPage.swift
//  e-commerce
//
//  Created by Mohamed Zaher on 15/12/2021.
//

import SwiftUI

struct OnBoardingPage: View {
    
    // Showing Login Page...
    
    @State var showLoginPage: Bool = false
    
    var body: some View {
       
        VStack (alignment: .leading) {
            
          
            
            Text("Find Your\nGadget")
                
                .font(.system(size: 45))
                .foregroundColor(.white)
            
            Image("spot")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button{
                
                withAnimation{
                    
                    showLoginPage = true
                }
                
            } label: {
                
                Text("Get Started")
                    .fontWeight(.semibold)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
                    .foregroundColor(Color.black)
            }
            .padding(.horizontal,30)
            
            
            Spacer()
        }
        
        .padding()
        .padding(.top,getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.black)
        
        .overlay(
            Group{
                
                if showLoginPage{
                    
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
          
    }
}
// Extending View to get Screen Bound
extension View{
    
    func getRect()-> CGRect {
        return UIScreen.main.bounds
    }
}
