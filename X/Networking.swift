//
//  Networking.swift
//  X
//
//  Created by Aria Zare on 3/27/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import Foundation
import AWSAppSync

public class Networking {
    
    var appSyncClient: AWSAppSyncClient?

    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
    }

//    func runQuery(){
//        appSyncClient?.fetch(query: QueryXAppTypesByIsUpgradedIndexQuery(isUpgraded: false), cachePolicy: .returnCacheDataAndFetch) {(result, error) in
//            if error != nil {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//            print("Query complete.")
//            result?.data?.queryXAppTypesByIsUpgradedIndex?.items!.forEach { print(($0?.email)! + " : " + ($0?.title)!) }
//        }
//    }
//
//    func runMutation(){
//        let mutationInput = CreateXAppTypeInput(email: "aria@test.com", title: "aira's text", isSpam: false, likeCount: 100, dislikeCount: 10, reportCount: 6, isReported: false, isUpgraded: true, tags: "tag")
//        appSyncClient?.perform(mutation: CreateXAppTypeMutation(input: mutationInput)) { (result, error) in
//            if let error = error as? AWSAppSyncClientError {
//                print("Error occurred: \(error.localizedDescription )")
//            }
//            if let resultError = result?.errors {
//                print("Error saving the item on server: \(resultError)")
//                return
//            }
//            print("Mutation complete.")
//        }
//    }
}
