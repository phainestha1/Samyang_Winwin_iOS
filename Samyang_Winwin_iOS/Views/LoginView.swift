//
//  LoginView.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/06/27.
//

import SwiftUI

struct LoginView: View {
    //State Variables
    @State var userId: String = ""
    @State var password: String = ""
    @State var isSecure: Bool = true
    
    // Variables
    let loginManager: LoginManager = LoginManager()
    let tokenVerifier: TokenVerifier = TokenVerifier()
    var token: String? = UserDefaults.standard.string(forKey: "token")
        
    var body: some View {
        NavigationView {
            VStack {
                TextField("아이디", text: $userId)
                    .autocapitalization(.none)
                SecureTextToggleComponent(password: $password, isSecure: $isSecure)
                
                Button("로그인") {
                    Task {
                        guard let response = await loginManager.authUser(userId, password)
                        else {
                            print("Login Failed.")
                            return
                        }
                        print("🔥🔥🔥 Login Reponse: \(response)")
                        UserDefaults.standard.set(response.token, forKey: "token")
                    }
                }
                
            }// VStack
            
        }// NavigationView
    }// body
}// LoginView

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userId: "winwin01", password: "123123123")
    }
}
