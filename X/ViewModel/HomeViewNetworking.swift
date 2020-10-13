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
    @Published var signInUpStatusText = ""
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

    func runQuery() {

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

                self.MergeResults()
            }

        case .mostLiked:

            appSyncClient?.fetch(query: ListXModelTypesLikesSortedQuery(id: "", likesCount: 0, isSpam: 0, email: "xappemailtest2020@gmail.com", isUpgraded: 0), cachePolicy: .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("MostLiked Query complete.")
                print(result?.data?.jsonObject)
                let resultJson = result?.data?.listXModelTypesLikesSorted?.jsonObject
                do {
                    if let resultJsonObject = resultJson as? JSONObject {
                        let resultList = try ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJsonObject)
                        self.rawListItems = resultList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]
                        self.MergeResults()
                        print("MostLiked Query data parsed")
                    } else {
                        print("MostLiked Query data parse error")
                    }
                } catch {
                    print("List Likes Sorted nonupgraded parse error")
                }
            }

        case .mostDisliked:

            appSyncClient?.fetch(query: ListXModelTypesDislikesSortedQuery(id: "", dislikesCount: 0, isSpam: 0, email: "xappemailtest2020@gmail.com", isUpgraded: 0), cachePolicy: .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("MostDislike Query complete.")

                let resultJson = result?.data?.listXModelTypesDislikesSorted?.jsonObject

                do {
                    if let resultJsonObject = resultJson as? JSONObject {
                        let resultList = try ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJsonObject)
                        self.rawListItems = resultList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]
                        self.MergeResults()
                        print("MostDisliked Query data parsed")
                    }
                    else {
                        print("MostDisliked Query data parse error")
                    }
                } catch {
                    print("List Likes Sorted nonupgraded parse error")
                }

//                let reslutList = try! ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJson as! JSONObject)
//                self.rawListItems = reslutList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]
//
//                self.MergeResults()
            }
        }
    }

    func MergeResults() {

        switch sortedBy {
        case .latest:
            appSyncClient?.fetch(query: ListXModelTypesQuery(id: "", isUpgraded: 1, isSpam: 0, email: "xappemailtest2020@gmail.com"), cachePolicy: .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("Latest Sort Query Upgraded complete.")
                print(result?.data)

                let itemsLocal = (result!.data!.listXModelTypes!.items!) as! [ListXModelTypesQuery.Data.ListXModelType.Item]

                let mergedResult = self.mergeUpgradedAndNotUpgradedPosts(upgradedItems: itemsLocal,
                    nonupgradedItems: self.rawListItems)

                self.listItems = mergedResult
            }


        case .mostLiked:
            appSyncClient?.fetch(query: ListXModelTypesLikesSortedQuery(id: "", likesCount: 0, isSpam: 0, email: "xappemailtest2020@gmail.com", isUpgraded: 1), cachePolicy: .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("MostLike Sort Query Upgraded complete.")
                print(result?.data?.jsonObject)
                let resultJson = result?.data?.listXModelTypesLikesSorted?.jsonObject
                do {
                    if let resultJsonObject = resultJson as? JSONObject {
                        let resultList = try ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJsonObject)
                        let itemsLocal = resultList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]
                        let mergedResult = self.mergeUpgradedAndNotUpgradedPosts(upgradedItems: itemsLocal,
                            nonupgradedItems: self.rawListItems)
                        self.listItems = mergedResult
                    }
                } catch {
                    print("List Likes Sorted nonupgraded parse error")
                }
            }


        case .mostDisliked:
            appSyncClient?.fetch(query: ListXModelTypesDislikesSortedQuery(id: "", dislikesCount: 0, isSpam: 0, email: "xappemailtest2020@gmail.com", isUpgraded: 1), cachePolicy: .fetchIgnoringCacheData) { (result, error) in

                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                print("MostDislike Sort Query Upgraded complete.")
                print(result?.data?.jsonObject)
                let resultJson = result?.data?.listXModelTypesDislikesSorted?.jsonObject
                do {
                    if let resultJsonObject = resultJson as? JSONObject {
                        let resultList = try ListXModelTypesQuery.Data.ListXModelType.init(jsonObject: resultJsonObject)
                        let itemsLocal = resultList.items! as! [ListXModelTypesQuery.Data.ListXModelType.Item]
                        let mergedResult = self.mergeUpgradedAndNotUpgradedPosts(upgradedItems: itemsLocal,
                            nonupgradedItems: self.rawListItems)
                        self.listItems = mergedResult
                    }
                } catch {
                    print("List Likes Sorted nonupgraded parse error")
                }
            }

        }



    }

    /*exp: result array will be the result of combining two arrays and will be returned at the end*/
    func mergeUpgradedAndNotUpgradedPosts(upgradedItems: [ListXModelTypesQuery.Data.ListXModelType.Item],
                                          nonupgradedItems: [ListXModelTypesQuery.Data.ListXModelType.Item]) -> [ListXModelTypesQuery.Data.ListXModelType.Item] {

        let postRatio = 2

        if upgradedItems.count == 0 {
            self.listItems = nonupgradedItems
            return nonupgradedItems
        }

        var mergedArrayCount = nonupgradedItems.count + (upgradedItems.count/postRatio) + 1
        print("upgraded Items are not more than expected")
        if upgradedItems.count >= nonupgradedItems.count / postRatio {
            mergedArrayCount = nonupgradedItems.count + upgradedItems.count
            print("upgraded Items were more than expected")
        }

        var underflowFlag = false

        var underflow = 0
        var mergedArray: [ListXModelTypesQuery.Data.ListXModelType.Item] = (0 ..< mergedArrayCount).map {

            if underflowFlag {
                underflow += 1
            } else {
                underflow = $0 - ($0/postRatio) - 1
            }
            print("$0: \($0) ")
            print("underflow: \(underflow) ")

            if underflow == -1 && upgradedItems.indices.contains($0/postRatio) {
                return upgradedItems[0]
            }

            if upgradedItems.indices.contains($0/postRatio) && nonupgradedItems.indices.contains(underflow) {
                return $0 % postRatio == 0 ? upgradedItems[$0/postRatio] : nonupgradedItems[underflow]
            } else if upgradedItems.indices.contains($0/postRatio){
                if !underflowFlag {
                    underflowFlag = true
                    underflow += 1
                    return upgradedItems[underflow]
                }
                return upgradedItems[underflow]
            } else {
                if !underflowFlag {
                    underflowFlag = true
                    underflow += 1
                    return nonupgradedItems[underflow]
                }
                underflowFlag = true
                return nonupgradedItems[underflow]
            }
        }

        print(mergedArray)
        return mergedArray
//        self.listItems = mergedArray
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

                self.MergeResults()
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

            self.MergeResults()

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
            signInUpStatusText = "Please fill all the required information"
        }

        if !isValidEmail(email: email) {
            signInUpStatusText = "Email is invalid"
        }

        if password.count < 8 {
            signInUpStatusText = "Password is too short"
        }

        appSyncClient?.perform(mutation: SignUpUserMutation(name: name, email: email, password: password)) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }

            let data = result?.data?.jsonObject
            guard let dictionaryResult = data?["signUpUser"] as? [String: Any] else {
                fatalError("couldn't convert signUpData to JSON")
            }

            let statusResult = dictionaryResult["statusCode"] as? Int ?? 0

            switch statusResult {
            case 200:
                self.signInUpStatusText = dictionaryResult["body"] as? String ?? ""
                self.userEmail = email
                self.userPassword = password
                print(statusResult)
                self.didSendSignUpEmail = true
            case 0:
                print("unknown error or problem")    
            default:
                self.signInUpStatusText = dictionaryResult["body"] as? String ?? "unknown error"
                print(statusResult)
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

            let data = result?.data?.jsonObject
            guard let dictionaryResult = data?["confirmUserEmail"] as? [String: Any] else {
                fatalError("couldn't convert Confirming email to JSON")
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

                self.emailConfirmStatusError = dictionaryResult["body"] as? String ?? ""
                print(statusResult)

            default:
                self.emailConfirmStatusError = dictionaryResult["body"] as? String ?? "Unknown Error"
                print(statusResult)
            }
        }
    }

    /*exp: Sign In*/
    func signIn(email: String, password: String) {

        if password == "" || email == "" {
            signInUpStatusText = "Please fill all the required information"
        }
        if !isValidEmail(email: email) {
            signInUpStatusText = "Email is invalid"
        }
        if password.count < 8 {
            signInUpStatusText = "Password incorrect(Too short)"
        }

        appSyncClient?.perform(mutation: SignInUserMutation(email: email, password: password)) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }

            let data = result?.data?.jsonObject
            guard let dictionaryResult = data?["signInUser"] as? [String: Any] else {
                fatalError("couldn't convert Sign In email to JSON")
            }

            let statusResult = dictionaryResult["statusCode"] as? Int ?? 0

            switch statusResult {
            case 200:
                self.token = dictionaryResult["token"] as? String
                self.userEmail = email
                self.userPassword = password
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.reconfigureAppSyncClient {
                    self.appSyncClient = appDelegate.appSyncClient
                    self.isUserSignedInVar = self.isUserSignedIn()
                }

            default:
                self.signInUpStatusText = dictionaryResult["body"] as? String ?? "Unknown Error"
                print(statusResult)
            }
        }
    }

    /*exp: Checking email string validation */

    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    /*****************************************************************************************************************/


    func upgradePost(id: String, title: String, isUpgraded: Int, tags: String, itemIndex: Int, action: @escaping (() -> Void)) {

        appSyncClient?.perform(mutation: UpdateXModelTypeMutation(id: id, title: title, isUpgraded: isUpgraded, tags: tags)) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")

                return
            }

            print("Upgrade mutation excuted")

            // updating the item after mutation
            let data = result?.data?.jsonObject
            guard let dictionaryResult = data?["updateXModelType"] as? [String: Any] else {
                fatalError("couldn't convert Upgrade Post email to JSON")
            }

            self.listItems[itemIndex].isUpgraded = dictionaryResult["isUpgraded"] as! Int

            print("is upgraded : \(dictionaryResult["isUpgraded"])")

            action()
        }
    }

}
