//
//  ProductList.swift
//  homework
//
//  Created by Nita Horia on 22.11.2022.
//

import SwiftUI

struct ProductList: View {
    @EnvironmentObject var storage: AppMemory
    
    let products: [Product]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(products) { product in
                    ProductBox(product: product)
                }
            }
        }
    }
}
