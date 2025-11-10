//
//  CategoryButtonView.swift
//  LittleLemon
//
//  Created by Leonardo Solís on 10/11/25.
//

import SwiftUI

struct CategoryButtonView: View {
    var product:String
    @Binding var selectedProduct: String
    
    var body: some View {
        Button{
            selectedProduct=product
            
        }label:{
            Text(product)
                .font(.headline)
                .bold()
                .foregroundStyle(product == selectedProduct ? .text : .principalLittleLemon)
                .padding(.horizontal,20)
                .padding(.vertical,10)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(product == selectedProduct ? .principalLittleLemon : .text))
                    
                )
            
        }
       
    }
}

#Preview {
    CategoryButtonView(product: "Product", selectedProduct: .constant(""))
}
