//
//  ProductBox.swift
//  homework
//
//  Created by Nita Horia on 22.11.2022.
//

import SwiftUI

struct ProductBox: View {
    @EnvironmentObject var storage: AppMemory
    
    let product: Product
    
        
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(
                    url: URL(string: product.image)
                ).frame(width: 150, height: 150)
                VStack {
                    ZStack {
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(product.category)
                            Text(product.price.description)
                            Text(product.quantityLeft.description + " left")
                        }
                        .padding(5)
                    }
                    .frame(width: 150, height: 150)
                }
            }
            HStack {
                Button (action: {
                    storage.products.removeAll {
                        $0.id == product.id
                    }
                }) {
                    Image(systemName: "trash").font(.system(size: 30))
                }
                NavigationLink (destination: CreateProduct(product: product)) {
                    Image(systemName: "pencil").font(.system(size: 30))
                }

            }
        }
    }
    
    
}
