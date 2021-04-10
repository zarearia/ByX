//
// Created by Aria Zare on 11/19/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI

struct ForgotPasswordPage: View {

    @EnvironmentObject var networking: HomeViewNetworking
    @State var email = ""

    var body: some View {
        ZStack {
            VStack {

                AuthenticationTextField(text: self.$email, placeHolder: "Enter Your Email")
                    .keyboardType(.numberPad)
                    .padding(.top, 100)
                    .padding()

                Text(self.networking.forgottenPasswordVerificationStatusError)
                    .foregroundColor(.red)

                AuthenticationButton(text: "Approve", screenWidth: UIScreen.main.bounds.width) {
                    networking.forgotPasswordMutation(email: self.email)
                }
                    .padding()
//
                NavigationLink(destination: SignUpConfirmPage().environmentObject(self.networking),
                    isActive: self.$networking.isForgotPasswordCodeVerificationPagePresented) { EmptyView() }

                Spacer()

            }
        }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
    }

}
