//
//  CreateProduct.swift
//  homework
//
//  Created by Nita Horia on 22.11.2022.
//

import SwiftUI

struct CreateProduct: View {
    @EnvironmentObject var storage: AppMemory
    
    @AppStorage("username") private var username = ""
    
    @Environment(\.dismiss) var dismiss
    
    var product : Product?
    
    @State private var title: String = ""
    @State private var category: String = ""
    @State private var image: String = ""
    @State private var price: String = ""
    @State private var popularity: String = ""
    @State private var quantityLeft: String = ""
    
    private func addProduct() {
        if
            title == "" ||
            category == "" ||
            image == "" ||
            price == "" ||
            popularity == "" ||
            quantityLeft == ""
        {
            return
        }
        
        if let product {
            let index = storage.products.firstIndex { $0.id == product.id }!
            storage.products[index].title = title
            storage.products[index].category = category
            storage.products[index].image = image
            storage.products[index].price = Float(price) ?? 0
            storage.products[index].popularity = Int(popularity) ?? 0
            storage.products[index].quantityLeft = Int(quantityLeft) ?? 0
            dismiss()
        } else {
            storage.products.append(.init(category: category, image: image, price: Float(price) ?? 0, title: title, popularity: Int(popularity) ?? 0, quantityLeft: Int(quantityLeft) ?? 0))
        }
        
        
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Title", text: $title)
                TextField("Category", text: $category)
                TextField("Image", text: $image)
                TextField("Price", text: $price).keyboardType(.numberPad)
                TextField("Popularity", text: $popularity).keyboardType(.numberPad)
                TextField("Quantity Left", text: $quantityLeft).keyboardType(.numberPad)
                Button(action: addProduct) {
                    Text(product == nil ? "Create" : "Edit")
                }
                .buttonStyle(.bordered)
            }.onAppear {
                if let product {
                    title = product.title
                    category = product.category
                    image = product.image
                    price = product.price.description
                    popularity = product.popularity.description
                    quantityLeft = product.quantityLeft.description
                }
            }
        }
    }
    
}


struct CreateProduct_Previews: PreviewProvider {
    static var previews: some View {
        CreateProduct()
    }
}
