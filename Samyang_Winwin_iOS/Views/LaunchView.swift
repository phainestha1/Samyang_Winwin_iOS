//
//  LaunchView.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/06/27.
//

import SwiftUI

struct LaunchView: View {
    
    var isLoggedIn: Bool = false
    
    var body: some View {
        switch isLoggedIn {
        case true:
            MainView()
        case false:
            LoginView()
        }
    }// body
}// LaunchView

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
