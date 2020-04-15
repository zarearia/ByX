//
//  SignInPage.swift
//  X
//
//  Created by Aria Zare on 3/11/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct SignInPage: View {

    @State var email = ""
    @State var password = ""

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {

                    SignInUpTextField(text: self.$email, placeHolder: "Email")
                        .padding()
                        .padding(.top, 100)

                    SignInUpTextField(text: self.$password, placeHolder: "Password")
                        .padding()

                    Spacer()

                    NavigationLink(destination: AuthenticationButton(text: "test", screenWidth: 100).navigationBarHidden(true)) {
                        AuthenticationButton(text: "Sign in", screenWidth: geo.size.width)
                            .padding(10)
                            .navigationBarHidden(true)
                            .navigationBarTitle(Text("Home"))
                    }
                        .padding(35)

                    HStack {

                        Spacer()

                        Button(action: self.buttonAction) {
                            Text("Sign up!")
                                .font(.system(size: 21, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#3BB0BA"))
                                .underline()
                        }

                        Spacer()

                        Button(action: self.buttonAction) {
                            Text("Forgot password?")
                                .font(.system(size: 21, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#3BB0BA"))
                                .underline()
                        }

                        Spacer()

                    }
                        .padding(30)
                        .padding([.top, .bottom], 50)

                }
            }
        }
    }

    func buttonAction() {

    }
}