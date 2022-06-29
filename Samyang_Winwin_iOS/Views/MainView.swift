//
//  ContentView.swift
//  Samyang_Winwin_iOS
//
//  Created by Noah's Ark on 2022/06/27.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Text("MainView")
                .padding()


            Button("Delete Token") {
                let token: String? = UserDefaults.standard.string(forKey: "token")
                UserDefaults.standard.removeObject(forKey: "token")
                print(token ?? "NO TOKEN!!!")
            }
            
        }// VStack
    }// body
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
