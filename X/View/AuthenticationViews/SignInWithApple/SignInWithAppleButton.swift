//
//  SignInWithAppleButton.swift
//  X
//
//  Created by Aria Zare on 11/4/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI
import AuthenticationServices
import UIKit

struct SignInWithAppleButton: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
    
}
