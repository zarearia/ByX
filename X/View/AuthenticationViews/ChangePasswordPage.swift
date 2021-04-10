//
// Created by Aria Zare on 11/21/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI

struct ChangePasswordPage: View {

    @EnvironmentObject var networking: HomeViewNetworking

    @State var password = ""
    @State var reEnteredPassword = ""

    var body: some View {
        VStack {
            AuthenticationTextField(text: $password, placeHolder: "New password")
                .padding()

            AuthenticationTextField(text: $reEnteredPassword, placeHolder: "Confirm new password")
                .padding()

            Text(self.networking.changePasswordStatusError)
                .foregroundColor(.red)

            AuthenticationButton(text: "Change Password", screenWidth: UIScreen.main.bounds.width) {
                networking.changePasswordMutation(password: self.password, reEnteredPassword: self.reEnteredPassword)
            }

            Spacer()

        }
    }
}
