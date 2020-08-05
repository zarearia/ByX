//
// Created by Aria Zare on 8/4/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI

struct SignUpConfirmPage: View {

    @EnvironmentObject var networking: HomeViewNetworking

    @State var approveCode: String = ""

    var body: some View {
        VStack {
            Spacer()

            TextField("Enter Code Here", text: $approveCode)

            Button(action: {
                self.networking.confirmSignUp(for: homeViewNetworking.userEmail, with: self.approveCode)
            }) {
                Text("Approve")
            }

            Spacer()

        }
    }
}
