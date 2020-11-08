//
//  SignInWithAppleDelegates.swift
//  X
//
//  Created by Aria Zare on 11/5/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import AuthenticationServices

class SignInWithAppleDelegates: NSObject {
    
}

extension SignInWithAppleDelegates: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

        print("Apple login delegate")

        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            homeViewNetworking.signInWithApple(credential: appleIDCredential)
            break
        
        case let passwordCredential as ASPasswordCredential:
//            TODO: Check if this part is Correct
            fatalError("Apple Sign In: ASPasswordCredential required(debug)")
            break
            
        default:
            break
        }
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
    }
}
