//
//  TextBox.swift
//  X
//
//  Created by Aria Zare on 3/13/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI
import AWSAppSync

struct TextBox: View {

    @EnvironmentObject var envObject: HomeViewNetworking
    var appSyncClient: AWSAppSyncClient?

    var currentItemIndex: Int {
        if let index = envObject.listItems.firstIndex(where: { $0.id == self.item.id }) {
            return index
        } else {
            return 0
        }
    }
    
    init(text: String, textColor: Color, boxColor: Color, boxOpacity: Double, thumbsupColor: Color, thumbsupNumColor: Color,
         thumbsdownNumColor: Color, thumbsdownColor: Color, seperateLineColor: Color, isUpgradeable: Bool,
         item: ListXModelTypesQuery.Data.ListXModelType.Item) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.appSyncClient = appDelegate.appSyncClient
        
        self.text = text
        self.textColor = textColor
        self.boxColor = boxColor
        self.boxOpacity = boxOpacity
        self.thumbsupColor = thumbsupColor
        self.thumbsupNumColor = thumbsupNumColor
        self.thumbsdownNumColor = thumbsdownNumColor
        self.thumbsdownColor = thumbsdownColor
        self.seperateLineColor = seperateLineColor
        self.isUpgradeable = isUpgradeable
        self._item = State(initialValue: item)
    }
    
    var text: String
    var textColor: Color
    var boxColor: Color
    var boxOpacity: Double = 1
    var thumbsupColor: Color
    var thumbsupNumColor: Color
    var thumbsdownNumColor: Color
    var thumbsdownColor: Color
    var seperateLineColor: Color
    var isUpgradeable = false
    
    @State var item: ListXModelTypesQuery.Data.ListXModelType.Item
    
    @State var localLike = false
    
    @State var falseBool: Bool = false
    
    @State var isLikeHitable = false
    @State var isDislikeHitable = false
    @State var isReportHitable = false

    var body: some View {

        VStack(alignment: .leading) {

            VStack(alignment: .leading) {
                Text(text)
                    .padding()
                    .foregroundColor(textColor)
            }
                .fixedSize(horizontal: false, vertical: true)
//                .background(Color(.white))
//                .cornerRadius(23)
//                .opacity(boxOpacity)
                .padding([.top, .leading, .trailing], 20)
                .onTapGesture(count: 2) {
                    self.likeAction()
                    self.localLike = self.envObject.listItems[self.currentItemIndex].isLikedByTheUser ?? false
                    self.envObject.listItems[self.currentItemIndex].isLikedByTheUser = !self.localLike
                }

            HStack {
                
                ToggleImage(isOn: Binding<Bool>($envObject.listItems[self.currentItemIndex].isLikedByTheUser) ?? $falseBool, imageName: "hand.thumbsup", action: likeAction)
                    .font(.system(size: 25, weight: .regular))
                    .foregroundColor(thumbsupColor)
                    .allowsHitTesting(isLikeHitable)
                Text(String(envObject.listItems[self.currentItemIndex].likesCount ?? 0))
                    .offset(y: 5)
                    .foregroundColor(thumbsupNumColor)
                    .padding(.trailing, 10)
                
                ToggleImage(isOn: Binding<Bool>($envObject.listItems[self.currentItemIndex].isDislikedByTheUser) ?? $falseBool, imageName: "hand.thumbsdown", action: dislikeAction)
                    .font(.system(size: 25, weight: .regular))
                    .foregroundColor(thumbsdownColor)
                    .offset(y: 10)
                    .allowsHitTesting(isDislikeHitable)
                Text(String(envObject.listItems[self.currentItemIndex].dislikesCount ?? 0))
                    .foregroundColor(thumbsdownNumColor)
                    .offset(y: 5)

                Spacer()

                Button(action: reportAction) {
                    if isUpgradeable {
                        HStack {
                            Text("Upgrade")
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .foregroundColor(Color(hex: "#6CAF26"))
                            
/******************************************************************************/
                            
//                            TODO: - Fix This Part
                            ToggleImage(isOn: $falseBool, imageName: "star", action: upgradeAction)
                            .font(.system(size: 25, weight: .medium, design: .rounded))
                            .foregroundColor(Color(hex: "#6CAF26"))
                        }
                    } else {
                        ToggleText(isOn: Binding<Bool>($envObject.listItems[self.currentItemIndex].isReportedByTheUser) ?? $falseBool, onText: "Reported", offText: "Report", action: reportAction)
                            .allowsHitTesting(isReportHitable)
                    }
                }
            }
                .padding([.leading, .trailing], 35)
                .padding(.bottom, 18)
                .padding(.top, 10)
                .background(Color(.white))

//            Spacer(minLength: 20)
//                .background(Color(.white))

//            Rectangle()
//                .foregroundColor(.white)
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .frame(height: 20)
//                .offset(y: -20)
////                .padding(5)
        }
            .background(boxColor)
            .cornerRadius(5)
            .opacity(boxOpacity)
            .shadow(color: Color(hex: "#757575"),radius: 5, x: 1, y: 2)
            .padding([.top, .leading, .trailing], 20)
            .onAppear{
                self.manageHitableObjects()
            }

    }
    
    
    
    func likeAction() {
        print("like exc")
        
        disableAllHits()
        
        appSyncClient?.perform(mutation: LikeXModelTypeMutation(id: envObject.listItems[self.currentItemIndex].id, email: "zarearia@email.com")) { (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
            
//            MARK: Is This Really Needed?
//            if let resultError = result?.errors {
//                print("Error saving the item on server: \(resultError)")
//                return
//            }
            
            print("Like mutation complete.")
            
            // updating the item
            self.appSyncClient?.fetch(query: GetXModelTypeQuery(id: self.envObject.listItems[self.currentItemIndex].id), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }

//                self.item.likesCount = (result?.data?.getXModelType?.likesCount!)
                self.envObject.listItems[self.currentItemIndex].likesCount = (result?.data?.getXModelType?.likesCount!)
//                self.envObject.listItems[self.currentItemIndex].isLikedByTheUser?.toggle()

                self.manageHitableObjects()
                
                print("Update query complete.")

            }
        }
    }
    
    func dislikeAction() {
        print("dislike exc")
        
        disableAllHits()
        
        appSyncClient?.perform(mutation: DislikeXModelTypeMutation(id: envObject.listItems[self.currentItemIndex].id, email: "zarearia@email.com")) { (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
            
            print("dislike mutation complete.")
            
            // updating the item
            self.appSyncClient?.fetch(query: GetXModelTypeQuery(id: self.envObject.listItems[self.currentItemIndex].id), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }

//                self.item.dislikesCount = (result?.data?.getXModelType?.dislikesCount!)
                self.envObject.listItems[self.currentItemIndex].dislikesCount = (result?.data?.getXModelType?.dislikesCount!)
//                self.envObject.listItems[self.currentItemIndex].isDislikedByTheUser?.toggle()

                self.manageHitableObjects()
                
                print("Update query complete.")

            }
        }
    }
    
    func reportAction() {
        print("report exc")
        
        disableAllHits()
        
        appSyncClient?.perform(mutation: ReportXModelTypeMutation(id: envObject.listItems[self.currentItemIndex].id, email: "zarearia@email.com")) { (result, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }
            
            print(result)
            
            print("report mutation complete.")

//            self.envObject.listItems[self.currentItemIndex].isReportedByTheUser?.toggle()


            self.manageHitableObjects()
            
            // updating the item
//            self.appSyncClient?.fetch(query: GetXModelTypeQuery(id: self.item.id), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
//                if error != nil {
//                    print(error?.localizedDescription ?? "")
//                    return
//                }
//
////                self.item.isReportedByTheUser = (result?.data?.getXModelType?.isReportedByTheUser!)
//
//                self.manageHitableObjects()
//
//                print("Update query complete.")
//
//            }
        }
    }
    
    func manageHitableObjects() {
        if envObject.listItems[self.currentItemIndex].isDislikedByTheUser == false && envObject.listItems[self.currentItemIndex].isReportedByTheUser == false {
            isLikeHitable = true
        } else {
            isLikeHitable = false
        }
        
        if envObject.listItems[self.currentItemIndex].isLikedByTheUser == false && envObject.listItems[self.currentItemIndex].isReportedByTheUser == false {
            isDislikeHitable = true
        } else {
            isDislikeHitable = false
        }
        
        if envObject.listItems[self.currentItemIndex].isLikedByTheUser == false && envObject.listItems[self.currentItemIndex].isDislikedByTheUser == false{
            isReportHitable = true
        } else {
            isReportHitable = false
        }
    }
    
    func disableAllHits() {
        isLikeHitable = false
        isDislikeHitable = false
        isReportHitable = false
    }
    
    func enableAllHits() {
        isLikeHitable = true
        isDislikeHitable = true
        isReportHitable = true
    }
    
    func upgradeAction() {
        print("hello world from upgrade")
    }
}
