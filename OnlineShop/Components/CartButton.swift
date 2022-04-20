//
//  CartButton.swift
//  OnlineShop
//
//  Created by Dyobi on 4/19/22.
//

import SwiftUI

struct CartButton: View {
    
    var numberOfProduct: Int
    
    var body: some View {
        
        ZStack (alignment: .topTrailing) {
            
            Image(systemName: "cart")
                .padding(.top, 5)
            
            if numberOfProduct > 0 {
                Text("\(numberOfProduct)")
                    .font(.caption2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(8)
            }
            
        } // ZStack
        
    } // body
    
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProduct: 1)
    }
}
