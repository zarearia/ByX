//
//  AddPageNetworking.swift
//  X
//
//  Created by Aria Zare on 3/28/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI
import AWSAppSync


//struct TagsTextFieldType {
//    var id = UUID()
//    var title: String!
//    
//    init(title: String) {
//        self.title = title
//    }
//    
//}


class AddPageNetworking: ObservableObject {
    
    var appSyncClient: AWSAppSyncClient?
    
    @Published var textFieldsText = ""
    @Published var isUpgraded = false
    
    @Published var firstTag = ""//[TagsTextFieldType].init(repeating: TagsTextFieldType(title: ""), count: 5)
    @Published var secondTag = ""
    @Published var thirdTag = ""
    @Published var forthTag = ""
    @Published var fifthTag = ""
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
    }
    
    func runMutation(){
         
        var tagsArray = [firstTag, secondTag, thirdTag, forthTag, fifthTag]
        
        let tags = firstTag + " " + secondTag + " " + thirdTag + " " + forthTag + " " + fifthTag
        
        textFieldsText.append(" ")
        
        for i in 0..<tagsArray.count {
            if tagsArray[i] == "" { break } else {
                let rawTag = tagsArray[i].replacingOccurrences(of: " ", with: "_")
                let tag = String("#\(rawTag) ")
                textFieldsText.append(tag)
                
            }
        }
        
        print(tags)
        
        let isUpgraded_binary = isUpgraded ? 1 : 0
        appSyncClient?.perform(mutation: CreateXModelTypeMutation(email: "zarearia@email.com", title: textFieldsText, isUpgraded: isUpgraded_binary, tags: tags)) { (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
//            if let resultError = result?.errors {
//                print("Error saving the item on server: \(resultError)")
//            }
            print("Mutation complete.")
            
            self.textFieldsText = ""
            self.isUpgraded = false
            self.firstTag = ""
            self.secondTag = ""
            self.thirdTag = ""
            self.forthTag = ""
            self.fifthTag = ""
        }
    }
}
