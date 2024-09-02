//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingdetail : Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    NutritionDetails(title: "calories", value: appetizer.calories)
                    NutritionDetails(title: "Carbs", value: appetizer.carbs)
                    NutritionDetails(title: "protein", value: appetizer.protein)
                }
            }
            Spacer()
            Button {
                order.add(appetizer)
                isShowingdetail = false
            } label : {
               APButtons(title: "$\(appetizer.price, specifier: "%.2f")- Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button { isShowingdetail = false } label: { Xdismiss() }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingdetail: .constant(true))
}

struct NutritionDetails: View {
    
    let title : String
    let value : Int
    
    var body: some View {
        VStack  {
            Text(title)
                .font(.caption)
                .bold()
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
        .padding()
    }
}
