//
//  ListItemComponent.swift
//  Samyang_Winwin_iOS
//
//  Created by Hyeon-sang Lee on 2022/06/28.
//
//  This file handles list items in the promotion page and the user market list.

import SwiftUI

struct ListItemComponent<Content: View>: View {
    
    let cornerRadius: CGFloat = 6
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack {
            HStack {
                Text("Client info here")
                Spacer()
                Text("Promotion Tag here")
            }
            HStack {
                Text(title)
                
                Spacer()
                
                content
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.black, lineWidth: 1)
        }
        .padding()

    }// body
}// ListItemComponent

struct ListItemComponent_Previews: PreviewProvider {
    static var previews: some View {
        ListItemComponent(title: "Market Image") {
            Text("Content Here")
        }
    }
}
