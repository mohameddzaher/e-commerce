//
//  LoginPage.swift
//  e-commerce
//
//  Created by Mohamed Zaher on 15/12/2021.
//

import SwiftUI

struct LoginPage: View {
    
    
    
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
       
        VStack{
            
            Text("Welcome\nBack")
               
                .font(.system(size: 40))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .frame(height: getRect().height / 4.7)
                .padding()
           
            
            ScrollView(.vertical, showsIndicators: false) {
                
                // Login Page Form...
                
                VStack (spacing: 40) {
                    Text("Login")
                        .font(.system(size: 26).bold())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.black)
                        .padding(.top,2)
                    
                    // Custom Text Field...
                    
                    CustomTextField(icon: "envelope", title: "Email", hint: "Mohamedzaher.dev@gmail.com", value: $loginData.email, showPassword: .constant(false))
                        .padding(.top,20)
                        .foregroundColor(Color.black)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "12345678", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top,10)
                        .foregroundColor(Color.black)
                    
                    // Register Reenter Password...
                    if loginData.RegisterUser{
                        
                        CustomTextField(icon: "lock", title: "Confirm Password", hint: "12345678", value: $loginData.confirmPassword, showPassword: $loginData.showConfirmPassword)
                            .padding(.top,10)
                            .foregroundColor(Color.black)
                    }
                    
                    // Forget Button Password...
                    
                    Button{
                        loginData.ForgerPassword()
                    } label: {
                        
                        Text("Forget Password?")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                    }
                    .padding(.top,3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Login Button...
                    
                    Button{
                        if loginData.RegisterUser{
                            loginData.Register()
                        }
                        else {
                            
                            loginData.Login()
                        }
                    } label: {
                        
                        Text(loginData.RegisterUser ? "Register" : "Login")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .padding(.vertical,20)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top,15)
                    .padding(.horizontal)
                    
                    // Register User Button...
                    
                    Button{
                        withAnimation{
                            loginData.RegisterUser.toggle()
                        }
                    } label: {
                        
                        Text(loginData.RegisterUser ? "Back To Login" : "Create Account")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                    }
                    .padding(.top,2)
                   
                }
                .padding(30)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                // Applying Custom Corners...
                    .clipShape(CustomCorners(Corners: [.topLeft, .topRight], radius: 40))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        
        // Clearing Data When Changes...
        
        
    }
    
    @ViewBuilder func CustomTextField (icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>)-> some View{
        
        VStack(alignment: .leading, spacing: 12){
            
            Label{
                
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue {
                
                SecureField(hint, text: value)
                    .padding(.top,2)
                
                
            } else {
                
                TextField(hint, text: value)
                    .padding(.top,2)
                
            }
            
            Divider()
                .background(Color.white.opacity(0.6))
        }
        .overlay(
         
            Group{
                
                if title.contains("Password"){
                    
                    Button(action: {
                        
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                    })
                        .offset(y: 8)
                }
            }
            
                ,alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
