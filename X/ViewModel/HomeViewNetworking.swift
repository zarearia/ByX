//
//  HomeViewModel.swift
//  X
//
//  Created by Aria Zare on 3/28/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI
import AWSAppSync

enum SortOptions {
    case mostLiked
    case mostDisliked
    case latest
}

class HomeViewNetworking: ObservableObject {
    
    var appSyncClient: AWSAppSyncClient?
    
    @Published var rawListItems = [ListXModelTypesQuery.Data.ListXModelType.Item]()
    @Published var listItems = [ListXModelTypesQuery.Data.ListXModelType.Item(id: "0", email: "12341234", title: "klanwfblawladk")]
    
    @Published var rawListItemsLikeSorted = [ListXModelTypesLikesSortedQuery.Data.ListXModelTypesLikesSorted.Item]()
    @Published var listItemsLikeSorted = [ListXModelTypesLikesSortedQuery.Data.ListXModelTypesLikesSorted.Item(id: "0", email: "12341234", title: "klanwfblawladk")]
    
    @Published var sortedBy: SortOptions = .latest
    
    @Published var searchText = ""

    //    TODO: Change to false(is the following line still necessary?)
//    @Published var isUserSignedIn = true
    @Published var signUpStatusText = ""
//    @State var signUpStatusError = false

    @Published var didSendSignUpEmail = false

//    TODO: Password and Email should be stored in user Defaults
    @Published var userEmail: String! {
        didSet {
            userDefaults.set(userEmail, forKey: userEmailKey)
        }
    }
    @Published var userPassword: String! {
        didSet {
            userDefaults.set(userPassword, forKey: userPasswordKey)
        }
    }

    @Published var token: String! {
        didSet {
            userDefaults.set(token, forKey: "token")
        }
    }

    @Published var isUserSignedInVar = true

    @Published var emailConfirmStatusError = ""

    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
    }

    func runQuery(){

        switch sortedBy {

        case .latest:

            appSyncClient?.fetch(query: ListXModelTypesQuery(id: "", isUpgraded: 0, isSpam: 0, email: "xappemailtest2020@gmail.com"), cachePolicy: .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("Latest Sort Query complete.")

                print(result?.data)

                self.rawListItems = (result!.data!.listXModelTypes!.items!) as! [ListXModelTypesQuery.Data.ListXModelType.Item]

                self.fetchResults()
            }

        case .mostLiked:

            appSyncClient?.fetch(query: ListXModelTypesLikesSortedQuery(id: "", likesCount: 0, isSpam: 0, email: "zarearia@email.com"), cachePolicy:  .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("Like Query complete.")

                let resultJson = result?.data?.listXModelTypesLikesSorted?.jsonObject
                let reslutList = try! ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJson as! JSONObject)
                self.rawListItems = reslutList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]

                self.fetchResults()
            }

        case .mostDisliked:

            appSyncClient?.fetch(query: ListXModelTypesDislikesSortedQuery(id: "", dislikesCount: 0, isSpam: 0, email: "zarearia@email.com"), cachePolicy:  .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("Dislike Query complete.")

                let resultJson = result?.data?.listXModelTypesDislikesSorted?.jsonObject
                let reslutList = try! ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJson as! JSONObject)
                self.rawListItems = reslutList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]

                self.fetchResults()
            }
        }
    }

    func fetchResults() {
        listItems = rawListItems
    }


    func searchTag() {

        if searchText != "" {
            appSyncClient?.fetch(query: ListXModelTypesSearchTagsQuery(id: "", tags: searchText, email: "zarearia@email.com"), cachePolicy: .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("Seatch Query complete.")

                let resultJson = result?.data?.listXModelTypesSearchTags?.jsonObject
                let reslutList = try! ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJson as! JSONObject)
                self.rawListItems = reslutList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]
                print(result?.data?.listXModelTypesSearchTags?.items)

                self.fetchResults()
            }
        } else {
            runQuery()
        }
    }

    func userPosterItemsQuery() {
        appSyncClient?.fetch(query: ListXModelTypesUserItemsQuery(id: "", email: "zarearia@email.com", dateCreated: ""), cachePolicy: .fetchIgnoringCacheData) { (result, error) in

            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            print("ListUserPosts Query complete.")

            let resultJson = result?.data?.listXModelTypesUserItems?.jsonObject
            let reslutList = try! ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJson as! JSONObject)
            self.rawListItems = reslutList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]
            print(result?.data?.listXModelTypesUserItems?.items)

            self.fetchResults()

        }
    }

    func spamsQuery() {
        //TODO: Change This (commented because of changes I am applying in schema and tests)
//        appSyncClient?.fetch(query: ListXModelTypesQuery(id: "", dateCreated: "", isSpam: 1, email: "zarearia@email.com"), cachePolicy:  .fetchIgnoringCacheData) { (result, error) in
//
//            if error != nil {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//            print("Latest Sort Query complete.")
//            self.rawListItems = (result!.data!.listXModelTypes!.items!) as! [ListXModelTypesQuery.Data.ListXModelType.Item]
//
//            self.fetchResults()
//        }
    }

    func reportedQuery() {
        //TODO: Change This (commented because of changes I am applying in schema and tests)
//        appSyncClient?.fetch(query: ListXModelTypesQuery(id: "", dateCreated: "", isSpam: 2, email: "zarearia@email.com"), cachePolicy:  .fetchIgnoringCacheData) { (result, error) in
//
//            if error != nil {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//            print("Latest Sort Query complete.")
//            self.rawListItems = (result!.data!.listXModelTypes!.items!) as! [ListXModelTypesQuery.Data.ListXModelType.Item]
//
//            self.fetchResults()
//        }
    }

    func deleteItem(item: ListXModelTypesQuery.Data.ListXModelType.Item) -> Bool {
        var errorFlag = true
        appSyncClient?.perform(mutation: DeleteXModelTypeMutation(id: item.id, email: item.email)) { result, error in
            if error != nil {
                print("delete error: \(error?.localizedDescription ?? "")")
                errorFlag = false
                return
            }
            print("item with title: \(item.title) deleted successfully")
        }
        return errorFlag;
    }

    /*MARK: Authentication */
    /*****************************************************************************************************************/

    /*exp: Check if signed in */
    func isUserSignedIn() -> Bool {
        isUserSignedInVar = userDefaults.value(forKey: "token") != nil
        return isUserSignedInVar
    }

    /*exp: Sign up */
    func signUp(name: String, email: String, password: String) {

        if name == "" || password == "" || email == "" {
            signUpStatusText = "Please fill all the required information"
        }

        if !isValidEmail(email: email) {
            signUpStatusText = "Email is invalid"
        }

        if password.count < 8 {
            signUpStatusText = "Password is too short"
        }

        appSyncClient?.perform(mutation: SignUpUserMutation(name: name, email: email, password: password)) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }

            let data = result!.data!.jsonObject
            guard let dictionaryResult = data["signUpUser"] as? [String: Any] else {
                fatalError("couldn't convert signUpData to JSON")
            }

            let statusResult = dictionaryResult["statusCode"] as! Int

            switch statusResult {
            case 200:
                self.signUpStatusText = dictionaryResult["body"] as! String
                self.userEmail = email
                self.userPassword = password
                print("200")
                self.didSendSignUpEmail = true
            case 403:
                self.signUpStatusText = dictionaryResult["body"] as! String
                print("403")
            case 500:
                self.signUpStatusText = dictionaryResult["body"] as! String
                print("500")
            default:
                self.emailConfirmStatusError = "Unknown Error"
                print("signUp switch default")
            }
        }
    }

    /*exp: Confirming email*/

    func confirmEmail(code: Int) {
        appSyncClient?.perform(mutation: ConfirmUserEmailMutation(email: userEmail, confirmationCode: code)) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }

            let data = result!.data!.jsonObject
            print(result!.data!.jsonObject)
            guard let dictionaryResult = data["confirmUserEmail"] as? [String: Any] else {
                fatalError("couldn't convert Confirming email to JSON")
            }

            let statusResult = dictionaryResult["statusCode"] as! Int

            switch statusResult{
            case 200:
                self.token = dictionaryResult["token"] as? String
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.reconfigureAppSyncClient {
                    self.appSyncClient = appDelegate.appSyncClient
                    self.isUserSignedInVar = self.isUserSignedIn()
                }

                self.emailConfirmStatusError = dictionaryResult["body"] as! String
                print("200")
            case 201:
                self.emailConfirmStatusError = dictionaryResult["body"] as! String
                print("201")
            case 403:
                self.emailConfirmStatusError = dictionaryResult["body"] as! String
                print("403")
            default:
                self.emailConfirmStatusError = "Unknown Error"
                print("confirmEmail switch default")
            }
        }
    }

    /*exp: Checking email string validation */

    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    /*****************************************************************************************************************/


    /*MARK: Authentication Amplify (delete soon)*/
    /*****************************************************************************************************************/
//
//
//    func fetchCurrentAuthSession() {
//        _ = Amplify.Auth.fetchAuthSession { result in
//            switch result {
//            case .success(let session):
//                print("Is user signed in - \(session.isSignedIn)")
//                DispatchQueue.main.async {
//                    self.isUserSignedIn = session.isSignedIn
//                }
//            case .failure(let error):
//                print("Fetch session failed with error \(error)")
//            }
//        }
//    }
//
//
//    func signUp(email: String, password: String) {
//        let userAttributes = [AuthUserAttribute(.email, value: email)]
//        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
//        _ = Amplify.Auth.signUp(username: email, password: password, options: options) { result in
//            switch result {
//            case .success(let signUpResult):
//                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
//                    print("Delivery details \(String(describing: deliveryDetails))")
//                    self.userEmail = email
//                    self.userPassword = password
//                    DispatchQueue.main.async {
//                        self.didSendSignUpEmail = true
//                    }
//                } else {
//                    print("SignUp Complete")
//                }
//
//            case .failure(let error):
//                print("An error occurred while registering a user \(error)")
//            }
//        }
//    }
//
//
//    func confirmSignUp(for email: String, with confirmationCode: String) {
//        _ = Amplify.Auth.confirmSignUp(for: email, confirmationCode: confirmationCode) { result in
//            switch result {
//            case .success(_):
//                print("Confirm signUp succeeded")
////                TODO: Sign in the user after sign up confirmation
//                self.signIn(email: email, password: self.userPassword)
//            case .failure(let error):
//                print("An error occurred while registering a user \(error)")
//            }
//        }
//    }
//
//
//    func signIn(email: String, password: String) {
//        _ = Amplify.Auth.signIn(username: email, password: password) { result in
//            switch result {
//            case .success(_):
//                print("Sign in succeeded")
//                self.userEmail = email
//                self.userPassword = password
//                self.isUserSignedIn = true
//            case .failure(let error):
//                print("Sign in failed \(error)")
//            }
//        }
//    }
}
