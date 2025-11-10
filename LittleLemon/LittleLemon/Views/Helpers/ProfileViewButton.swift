//
//  ProfileViewButton.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 10/11/25.
//

import SwiftUI

struct ProfileViewButton: View {
    var title : String
    @State private var isSelected = false
    var body: some View {
        Button{
            isSelected.toggle()
        }label: {
            Text(title)
                .bold()
                .foregroundStyle(isSelected ? .text : .gray)
                .padding(.horizontal,20)
                .padding(.vertical,15)
                .background(
                    RoundedRectangle(cornerRadius: isSelected ? 15 : 1)
                        .fill(isSelected ? Color.principalLittleLemon : .clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: isSelected ? 15 : 1)
                                .stroke(Color.principalLittleLemon, lineWidth: 1.5)
                        )
                )
                
        }
    }
}

#Preview {
    ProfileViewButton(title: "Change")
}
