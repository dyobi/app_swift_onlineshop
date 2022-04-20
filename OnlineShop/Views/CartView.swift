//
//  CartView.swift
//  OnlineShop
//
//  Created by Dyobi on 4/19/22.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        ScrollView {
            
            if cartManager.paymentSuccess {
                
                Text("Thanks for your purchase! You'll get cozy in our comfy sweaters soon! You'll also receive an email confirmation shortly.")
                    .padding()
                
            } else {
                
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("\(cartManager.total).00")
                            .bold()
                    } // HStack
                    .padding()
                    
                    PaymentButton(action: cartManager.pay)
                        .padding()
                } else {
                    Text("Your cart is empty")
                }
                
            }
            
        } // ScrollView
        .navigationTitle("My Cart")
        .padding(.top)
        .onDisappear {
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
        
    } // body
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
