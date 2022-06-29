//
//  TokenVerifier.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/06/29.
//

import Foundation

struct TokenVerifier {
    let token: String = ""
    let url: URL? = URL(string: "\(basicUrl)/user/token")
            
    func tokenLogin(_ token: String) async {
        if let url = url {
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decodedData = try JSONDecoder().decode(UserModel.self, from: data)

                print("✅✅✅ Decoded Data: \(decodedData)")
            } catch {
                return
            }
        }
    }// tokenLogin
    
}// TokenVerifier
