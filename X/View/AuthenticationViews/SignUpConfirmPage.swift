//
// Created by Aria Zare on 8/4/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI

struct SignUpConfirmPage: View {

    @EnvironmentObject var networking: HomeViewNetworking

    @State var confirmationCode: String = ""

    var body: some View {
        VStack {
            Spacer()

            TextField("Enter Code Here", text: $confirmationCode)
                .keyboardType(.numberPad)

            Button(action: {
                self.networking.confirmEmail(code: Int(self.confirmationCode) ?? 0)
            }) {
                Text("Approve")
            }

            Spacer()

        }
    }
}
