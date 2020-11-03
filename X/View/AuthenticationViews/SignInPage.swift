//
//  SignInPage.swift
//  X
//
//  Created by Aria Zare on 3/11/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct SignInPage: View {

    @EnvironmentObject var networking: HomeViewNetworking

    @State var pageType: AuthenticationPageType
    @State var email = ""
    @State var password = ""
    @State var name = ""

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {

                    if self.pageType == .signUp {
                        SignInUpTextField(text: self.$name, placeHolder: "Name")
                            .keyboardType(.emailAddress)
                            .padding()
                            .padding(.top, 100)
                    }


                    SignInUpTextField(text: self.$email, placeHolder: "Email")
                        .keyboardType(.emailAddress)
                        .padding()

                    SignInUpTextField(text: self.$password, placeHolder: "Password")
                        .padding()

                    Text(self.networking.signInUpStatusText)
                        .foregroundColor(.red)

                    Spacer()

                        AuthenticationButton(text: self.pageType == .signIn ? "Sign In" : "Sign Up", screenWidth: geo.size.width) {
                            switch self.pageType {
                            case .signIn:
                                self.networking.signIn(email: self.email, password: self.password)
                            case .signUp:
                                self.networking.signUp(name: self.name, email: self.email, password: self.password)
                            }
                        }
                            .padding(10)
                            .navigationBarHidden(true)
                            .navigationBarTitle(Text("Home"))

                    NavigationLink(destination: SignUpConfirmPage().environmentObject(self.networking),
                        isActive: self.$networking.didSendSignUpEmail) { EmptyView() }

                    HStack {

                        Spacer()

                        Button(action: self.buttonAction) {
                            Text(self.pageType == .signIn ? "Sign Up" : "Sign In")
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
        self.pageType = self.pageType == .signUp  ? .signIn : .signUp
    }
}