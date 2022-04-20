//
//  ContentView.swift
//  OnlineShop
//
//  Created by Dyobi on 4/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView (.vertical, showsIndicators: false) {
                LazyVGrid (columns: columns, spacing: 12) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                } // LazyVGrid
                .padding()
            } // ScrollView
            .navigationTitle(Text("Sweater Shop"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProduct: cartManager.products.count)
                }
            }
            
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        
    } // body
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
