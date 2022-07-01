//
//  LaunchView.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/06/27.
//

import SwiftUI

struct LaunchView: View {

    @StateObject var autoLoginManger: AutoLoginManager = AutoLoginManager()
        
    var body: some View {
        switch autoLoginManger.isLoggedIn {
        case true:
            MainView()
                .environmentObject(autoLoginManger)
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
