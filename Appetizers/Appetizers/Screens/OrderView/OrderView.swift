//
//  OrderView.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order Palced")
                    } label: {
                        APButtons(title: "$\(order.totalPrice, specifier: "%.2f") - PlaceOrder")
                    }
                    .padding(.bottom, 25)
            }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no orders in your orders right now")
                }
            
            }
            .navigationTitle("Orders")

        }
    }
    
}

#Preview {
    OrderView()
}
