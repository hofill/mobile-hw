//
//  ContentView.swift
//  homework
//
//  Created by Nita Horia on 16.11.2022.
//

import SwiftUI

class AppMemory: ObservableObject {
    @Published var products = [Product]()
}

struct ContentView: View {
    @StateObject var storage = AppMemory()
    
    var body: some View {
        TabView {
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "list.dash")
                }
            CreateProduct()
                .tabItem {
                    Label("Add Product", systemImage: "list.dash")
                }
        }
        .environmentObject(storage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
