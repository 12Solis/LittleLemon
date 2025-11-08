//
//  Home.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 06/11/25.
//

import SwiftUI
import CoreData

struct Home: View {
    let persistence = PersistenceController.shared
    var body: some View {
        
        TabView{
            Menu().tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            UserProfile().tabItem{
                Label("Profile", systemImage: "square.and.pencil")
            }
        }
        .environment(\.managedObjectContext, persistence.container.viewContext)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
