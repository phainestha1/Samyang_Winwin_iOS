//
//  AutoLoginManager.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/07/01.
//

import Foundation

final class AutoLoginManager: ObservableObject {
    // State Variables
    @Published var userModel: UserModel?
    @Published var isLoggedIn: Bool = false
    
    // Variables
    let tokenVerifier: TokenVerifier = TokenVerifier()
    
    init() {
        Task {
            await useTokenLogin()
        }
    }
    
    private func useTokenLogin() async {
        guard let response = await tokenVerifier.tokenLogin() else {
            return
        }
        
        self.userModel = response
        self.isLoggedIn = true
    }

}// AutoLoginManager
