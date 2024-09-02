//
//  Xdismiss.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import SwiftUI

struct Xdismiss: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
         Image(systemName: "xmark")
                .frame(width: 44, height: 44)
                .imageScale(.medium)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    Xdismiss()
}
