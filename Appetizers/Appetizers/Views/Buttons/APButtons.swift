//
//  APButtons.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import SwiftUI

struct APButtons: View {
    let title : LocalizedStringKey
    
    var body: some View {
        
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandprimary)
            .cornerRadius(10)    }
}

#Preview {
    APButtons(title: "Test tit6le")
}
