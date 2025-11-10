//
//  LittleLemonMessageView.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 09/11/25.
//

import SwiftUI

struct LittleLemonMessageView: View {
    @Binding var isSearching: Bool
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Color.principalLittleLemon
            VStack(alignment: .leading){
                Text("Little Lemon")
                    .font(.system(size: 48,design: .serif)).fontWeight(.heavy)
                    .foregroundStyle(.accentLittleLemon)
                    .padding()
                    .padding(.bottom,-20)

                
                HStack{
                    VStack(alignment:.leading){
                        Text("Chicago")
                            .font(.system(.largeTitle, design: .serif))
                            .fontWeight(.semibold)
                            .foregroundStyle(.text)
                            .padding(.horizontal).padding(.top,-20)
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(.system(.headline, design: .serif))
                            .fontWeight(.semibold)
                            .foregroundStyle(.text)
                            .padding(.horizontal)
                        
                    }
                   Image("dishImagePresentation")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.trailing,1)
                }
                
                Spacer()
            }
            Button{
                isSearching.toggle()
            }label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.text)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        
    }
}

#Preview {
    LittleLemonMessageView(isSearching: .constant(false))
}
