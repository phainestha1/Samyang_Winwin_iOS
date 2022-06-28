//
//  LoginManager.swift
//  Samyang_Winwin_iOS
//
//  Created by Noah's Ark on 2022/06/28.
//
// 이거 뷰모델 맞나..?

import Foundation

struct LoginManager {
    let url: URL? = URL(string: "\(basicUrl)/user/login")

    func authUser(_ userId: String, _ password: String) async -> UserModel? {
        let userInfo: LoginModel = LoginModel(userId: userId, password: password)
        
        guard let encoded = try? JSONEncoder().encode(userInfo)
        else {
            print("Failed to encode order")
            return nil
        }
        
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
                
                let decodedData = try JSONDecoder().decode(UserModel.self, from: data)
                return decodedData
            } catch {
                print("authUser Process Failed, \(error)")
            }
        }
        
        return nil
    }// authUser
    
}// LoginManager
