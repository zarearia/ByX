//
// Created by Aria Zare on 8/4/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI

struct SignUpConfirmPage: View {

    @EnvironmentObject var networking: HomeViewNetworking

    @State var confirmationCode: String = ""

    var body: some View {

        ZStack {
            VStack {

                AuthenticationTextField(text: self.$confirmationCode, placeHolder: "Enter Code Here")
                    .keyboardType(.numberPad)
                    .padding(.top, 100)
                    .padding()

//                TextField("Enter Code Here", text: $confirmationCode)
//                    .keyboardType(.numberPad)

                AuthenticationButton(text: "Approve", screenWidth: UIScreen.main.bounds.width) {
                    self.networking.confirmEmail(code: Int(self.confirmationCode) ?? 0)
                }
                    .padding()
//            Button(action: {
//
//            }) {
//                Text("Approve")
//                    .padding(.top, 200)
//            }

                NavigationLink(destination: ChangePasswordPage().environmentObject(self.networking)
                    , isActive: self.$networking.isChangePasswordPagePresented) { EmptyView() }

                Spacer()

            }
        }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
    }
}
