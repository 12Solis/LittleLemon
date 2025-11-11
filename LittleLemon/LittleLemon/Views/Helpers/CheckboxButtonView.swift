//
//  CheckboxButtonView.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 10/11/25.
//

import SwiftUI

struct CheckboxButtonView: View {
    @State private var isActive = true
    var body: some View {
        
        Button{
            isActive.toggle()
        }label: {
            Image(systemName: isActive ? "checkmark.square.fill" : "square")
                .foregroundStyle(.principalLittleLemon)
                .font(.system(size: 25))
        }
        
        
    }
}

#Preview {
    CheckboxButtonView()
}
