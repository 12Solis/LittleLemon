//
//  Menu.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 06/11/25.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text("Little Lemon")
                .font(.title).fontWeight(.bold)
                .padding(.horizontal)
            Text("Chicago")
                .padding(.horizontal)
                .font(.title2).fontWeight(.semibold)
            Text("The Little Lemon Foor Ordering App!")
                .padding(.horizontal)
            
            List{
                
            }
        }
    }
}

#Preview {
    Menu()
}
