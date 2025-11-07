//
//  Home.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 06/11/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu().tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            UserProfile().tabItem{
                Label("Profile", systemImage: "square.and.pencil")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
