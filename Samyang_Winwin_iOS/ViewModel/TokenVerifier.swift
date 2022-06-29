//
//  TokenVerifier.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/06/29.
//

import Foundation

struct TokenVerifier {
    let token: String = ""
    let url: URL? = URL(string: "\(Constant.basicUrl)/user/token")
    
    func tokenLogin(_ token: String) async -> UserModel? {
        if let url = url {
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let response = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                
                let userModel = UserModel(
                    _id: response["_id"] as! String,
                    channel: response["channel"] as! String,
                    userName: response["userName"] as! String,
                    storeName: response["storeName"] as! String,
                    userImage: response["userImage"] as! String,
                    phoneNumber: response["phoneNumber"] as! String,
                    userAddress: response["userAddress"] as! String,
                    role: response["role"] as! String,
                    token: token
                )
                
                return userModel
                
            } catch {
                print("✅✅✅ Token Login Failed: \(error)")
            }
        }
        
        return nil
    }// tokenLogin
    
}// TokenVerifier
