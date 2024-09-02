//
//  ContentView.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order

    var body: some View {
        
        TabView {
           AppetizerListView()
                .tabItem { Label("Home", systemImage: "house")  }
            AccountView()
                 .tabItem {  Label("Account", systemImage: "person")  }
            OrderView()
                 .tabItem {  Label("OrderView", systemImage: "bag")  }
                 .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
