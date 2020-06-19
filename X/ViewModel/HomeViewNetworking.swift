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
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
    }
    
    func runQuery(){
        
        switch sortedBy {
            
        case .latest:
            
            appSyncClient?.fetch(query: ListXModelTypesQuery(id: "", dateCreated: "", isSpam: 0, email: "zarearia@email.com"), cachePolicy:  .fetchIgnoringCacheData) { (result, error) in
                    
                    if error != nil {
                        print(error?.localizedDescription ?? "")
                        return
                    }
                    print("Latest Sort Query complete.")
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
        appSyncClient?.fetch(query: ListXModelTypesQuery(id: "", dateCreated: "", isSpam: 1, email: "zarearia@email.com"), cachePolicy:  .fetchIgnoringCacheData) { (result, error) in

            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            print("Latest Sort Query complete.")
            self.rawListItems = (result!.data!.listXModelTypes!.items!) as! [ListXModelTypesQuery.Data.ListXModelType.Item]

            self.fetchResults()
        }
    }

    func reportedQuery() {
        appSyncClient?.fetch(query: ListXModelTypesQuery(id: "", dateCreated: "", isSpam: 2, email: "zarearia@email.com"), cachePolicy:  .fetchIgnoringCacheData) { (result, error) in

            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            print("Latest Sort Query complete.")
            self.rawListItems = (result!.data!.listXModelTypes!.items!) as! [ListXModelTypesQuery.Data.ListXModelType.Item]

            self.fetchResults()
        }
    }
    
}



























