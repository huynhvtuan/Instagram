//
//  CreateUserNameView.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import SwiftUI

struct CreateUserNameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll will this username to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            TextField("Username", text: $viewModel.userName)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            TextField("FullName", text: $viewModel.fullName)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())

            NavigationLink {
                CreatePasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 40)
                    .background(Color(.systemBlue))
                    .cornerRadius(6)
            }.padding(.vertical)
            Spacer()
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserNameView()
    }
}
