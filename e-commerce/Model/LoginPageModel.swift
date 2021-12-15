//
//  LoginPageModel.swift
//  e-commerce
//
//  Created by Mohamed Zaher on 15/12/2021.
//

import SwiftUI

class LoginPageModel: ObservableObject {
 
    //    Login Properties...
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    //    Register Properties...
    @Published var RegisterUser: Bool = false
    @Published var confirmPassword: String = ""
    @Published var showConfirmPassword: Bool = false
    
    //    Login Call...
    func Login() {
    //        Do Action Here...
        
    }
    
    func Register () {
        //        Do Action Here...
        
    }
    
    func ForgerPassword () {
        //        Do Action Here...
        
    }
}
