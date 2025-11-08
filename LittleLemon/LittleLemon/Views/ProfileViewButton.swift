//
//  ProfileViewButton.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 10/11/25.
//

import SwiftUI

struct ProfileViewButton: View {
    var body: some View {
        Button{
            
        }label: {
            Text("Change")
                .padding(10)
            background(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray, lineWidth: 1)
            )
                
        }
    }
}

#Preview {
    ProfileViewButton()
}
