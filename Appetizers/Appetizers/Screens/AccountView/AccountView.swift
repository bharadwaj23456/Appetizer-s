//
//  AccountView.swift
//  Appetizers
//
//  Created by Reddy Bharadwaj Chowdary on 01/08/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField : FormTextField?
    enum FormTextField {
        case firstName, lastName, email
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField,equals: .firstName)
                        .onSubmit { focusedTextField = .lastName  }
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField,equals: .lastName)
                        .onSubmit { focusedTextField = .email  }
                    TextField("E-mail", text: $viewModel.user.email)
                        .focused($focusedTextField,equals: .email)
                        .onSubmit { focusedTextField = nil  }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                    
                    Section(header: Text("Requests")) {
                        Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        Toggle("Frequent refills", isOn: $viewModel.user.frequentRefill)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandprimary))
                    
                }
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear(perform: viewModel.retrieveUser)
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
