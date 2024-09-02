//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel : ObservableObject {
    
    @Published  var appetizers: [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

    
    
    func getAppetizers() {
        isLoading = true
        Task {
            do {
                appetizers  = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableTocomplete:
                        alertItem = AlertContext.unableToComplete
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }

}
