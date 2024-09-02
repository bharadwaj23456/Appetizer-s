//
//  Order.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import SwiftUI

final class Order : ObservableObject {
    
    @Published var items : [Appetizer] = []
    
    var totalPrice : Double  {
        items.reduce(0) { $0 + $1.price}
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
        
    func deleteItems(at Offesets: IndexSet ) {
            items.remove(atOffsets: Offesets)
        }

    }
    
}
