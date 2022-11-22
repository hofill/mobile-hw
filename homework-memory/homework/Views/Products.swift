//
//  Categories.swift
//  homework
//
//  Created by Nita Horia on 16.11.2022.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var storage: AppMemory
    
    @AppStorage("products") var productsString: String = ""
    var products: [String] {
        productsString.split(separator: ",").map{$0.lowercased().trimmingCharacters(in: .whitespaces)}
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Products").font(.largeTitle).fontWeight(.bold)
                    ProductList(products: storage.products.sorted { a,b in
                        a.popularity > b.popularity
                    })
                }
            }
        }.navigationTitle("Products")
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
