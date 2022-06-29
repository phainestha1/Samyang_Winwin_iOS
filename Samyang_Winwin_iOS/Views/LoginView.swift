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
    
    let loginManager: LoginManager = LoginManager()
    let tokenVerifier: TokenVerifier = TokenVerifier()
    
    var body: some View {
        VStack {
            TextField("아이디", text: $userId)
                .autocapitalization(.none)
            SecureTextToggleComponent(password: $password, isSecure: $isSecure)

            Button("로그인") {
                Task {
                    print("🔥🔥🔥")
                    let response = await loginManager.authUser(userId, password)
                    print(response ?? "User Authentication Failed")
                }
            }

        }// VStack
        .onAppear {
            Task {
                let token: String = ""
                await tokenVerifier.tokenLogin(token)
            }
        }
    }// body
}// LoginView

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userId: "winwin01", password: "123123123")
    }
}

struct SecureTextToggleComponent: View {
    // State Variables
    @Binding var password: String
    @Binding var isSecure: Bool
    
    var body: some View {
        switch isSecure {
        case true:
            HStack {
                SecureField("비밀번호", text: $password)
                Spacer()
                Button("Click Me!") {
                    self.isSecure.toggle()
                }
            }
            
        case false:
            HStack {
                TextField("비밀번호", text: $password)
                Spacer()
                Button("Click Me!") {
                    self.isSecure.toggle()
                }
            }
        }
        
    }// body
}// PasswordComponent
