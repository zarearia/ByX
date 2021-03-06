//
//  FirstPage.swift
//  X
//
//  Created by Aria Zare on 3/11/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct FirstPage: View {

    @EnvironmentObject var enviromentObject: HomeViewNetworking
    
    @State var appleSignInDelegates: SignInWithAppleDelegates! = SignInWithAppleDelegates()
    @State var sceneDelegate: SceneDelegate! = SceneDelegate()

    var body: some View {

        NavigationView {
            GeometryReader { geo in
                Color(.white)
                    .edgesIgnoringSafeArea(.all)

                VStack(alignment: .center) {

                    Spacer()

                    Text("Welcome to X")
                        .font(.system(size: 45, design: .rounded))
                        .fontWeight(.semibold)

                    Spacer()

                    NavigationLink(destination: SignInPage(pageType: .signUp).environmentObject(self.enviromentObject)) {
                        AuthenticationButton(text: "Sign up", screenWidth: geo.size.width).label
                            .padding(10)
                            .navigationBarTitle(Text(""))
                            .navigationBarHidden(true)
                    }


                    NavigationLink(destination: SignInPage(pageType: .signIn).environmentObject(self.enviromentObject)) {
                        AuthenticationButton(text: "Sign in", screenWidth: geo.size.width).label
                            .padding(10)
                            .navigationBarHidden(true)
                            .navigationBarTitle(Text("Home"))
                    }
                    
                    AuthenticationButton.init(text: "Login with FACEBOOK", screenWidth: geo.size.width) {
                        self.enviromentObject.signInWithFacebook()
                    }
                        .padding(10)
                    
                    SignInWithAppleButton()
                        .frame(width: geo.size.width/1.3)
                        .frame(height: geo.size.width/5.5)
                        .onTapGesture(perform: showAppleLogin)
                        .padding(10)

                    NavigationLink(destination: ForgotPasswordPage().environmentObject(self.enviromentObject)) {
                            Text("Forgot password?")
                                .font(.system(size: 21, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#3BB0BA"))
                                .underline()
                                .padding(.top, 50)

                    }

                    HStack {

                        Spacer()

                        Button(action: self.buttonAction) {
                            Text("Privacy policy")
                                .font(.system(size: 21, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#3BB0BA"))
                                .underline()
                        }

                        Spacer()

                        Button(action: self.buttonAction) {
                            Text("Terms of use")
                                .font(.system(size: 21, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#3BB0BA"))
                                .underline()
                        }

                        Spacer()

                    }
                        .padding(30)

                }
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            }
        }
    }

    func buttonAction() {
        print("Button pressed")
//        self.enviromentObject.isUserSignedIn.toggle()
    }
    
    func showAppleLogin() {
        print("Apple login pressed")
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        
        request.requestedScopes = [.email, .fullName]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        
        authorizationController.delegate = appleSignInDelegates


        authorizationController.presentationContextProvider = sceneDelegate

        authorizationController.performRequests()
        
    }

}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
        )
    }
}
