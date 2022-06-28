//
//  UserModel.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/06/27.
//

import Foundation

struct UserModel: Codable {
    let _id: String
    let channel: String
    let userName: String
    let storeName: String
    let userImage: String
    let phoneNumber: String
    let userAddress: String
    let role: String
    let token: String
}
