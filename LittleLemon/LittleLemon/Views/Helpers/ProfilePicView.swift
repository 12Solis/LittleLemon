//
//  ProfilePicView.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 10/11/25.
//

import SwiftUI

struct ProfilePicView: View {
    var body: some View {
        Image("ProfilePicture")
            .resizable()
            .scaledToFit()
             .clipShape(Circle())
             .overlay(
                 Circle().stroke(.white, lineWidth: 2)
             )
             
             
    }
}

#Preview {
    ProfilePicView()
}
