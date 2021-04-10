//
// Created by Aria Zare on 11/19/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import AWSAppSync

extension HomeViewNetworking {

    func forgotPasswordMutation(email: String) {

        if !self.isValidEmail(email: email) {
            self.forgottenPasswordVerificationStatusError = "invalid Email"
            print("invalid email")
            return
        }

        appSyncClient?.perform(mutation: SendEmailForForgottenPasswordMutation(email: email)) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }

            guard let data = result?.data?.jsonObject else {
                self.forgottenPasswordVerificationStatusError = "unknown error"
                print("unknown problem")
                return
            }

            guard let dictionaryResult = data["sendEmailForForgottenPassword"] as? [String: Any] else {
                fatalError("couldn't convert signUpData to JSON")
            }

            let statusResult = dictionaryResult["statusCode"] as? Int ?? 0

            switch statusResult {
            case 200:
                self.forgottenPasswordVerificationStatusError = dictionaryResult["body"] as? String ?? ""
                self.userEmail = email
//                self.userPassword = password
                print(statusResult)
                self.isForgotPasswordCodeVerificationPagePresented = true
//            case 404:
//            case 500:
            default:
                self.forgottenPasswordVerificationStatusError = dictionaryResult["body"] as? String ?? "unknown error"
                print(statusResult)
            }
        }
    }


    func changePasswordMutation(password: String, reEnteredPassword: String) {

        if password.count < 8 {
            self.changePasswordStatusError = "Passwords is too short"
            return
        } else if password != reEnteredPassword {
            self.changePasswordStatusError = "Passwords doesn't match"
            return
        }


        appSyncClient?.perform(mutation: ChangePasswordMutation(email: self.userEmail,
            password: password)) { result, error in

            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }

            guard let data = result?.data?.jsonObject else {
                self.forgottenPasswordVerificationStatusError = "unknown error"
                print("unknown problem")
                return
            }

            guard let dictionaryResult = data["changePassword"] as? [String: Any] else {
                fatalError("couldn't convert signUpData to JSON")
            }

            let statusResult = dictionaryResult["statusCode"] as? Int ?? 0

            switch statusResult {
            case 200:

                self.token = dictionaryResult["token"] as? String
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.reconfigureAppSyncClient {
                    self.appSyncClient = appDelegate.appSyncClient
                    self.isUserSignedInVar = self.isUserSignedIn()
                }

                self.changePasswordStatusError = dictionaryResult["body"] as? String ?? ""
                print(statusResult)

            default:
                self.changePasswordStatusError = dictionaryResult["body"] as? String ?? "Unknown Error"
                print(statusResult)
            }


        }
    }
}
