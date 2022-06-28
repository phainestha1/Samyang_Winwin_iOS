//
//  LoginView.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/06/27.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Text("ID")
            Text("Password")
                .padding()
            
            Button("로그인") {
                print("Let me log in!!")
            }
        }

    }// body
}// LoginView

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
