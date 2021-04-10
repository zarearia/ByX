//
//  HomePage.swift
//  X
//
//  Created by Aria Zare on 3/13/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI
import AWSAppSync


struct HomePage: View {

    @EnvironmentObject var observedObj: HomeViewNetworking
    @State var searchText = ""
    @State var searchBarHeight: CGFloat = 0

    
    var body: some View {
        NavigationView {
            ZStack {

//                Color(hex: "#FAF5E4")
//                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack {
                        ForEach(observedObj.listItems, id: \.self.id) { item in
                            NavigationLink(destination: SwipeablePageView(currentItem: item).padding(.top, -(UIScreen.main.bounds.height / 3))/*.environmentObject(self.observedObj)*/)
                            /*.navigationBarHidden(true)*/
                            /*.navigationBarTitle(""))*/ {
                                TextBox(text: item.title, textColor: Color(.white), boxColor: Color(hex: "#4891E1"),
                                    boxOpacity: 1, thumbsupColor: Color(hex: "#4891E1"), thumbsupNumColor: Color(hex: "#4891E1"),
                                    thumbsdownNumColor: Color(hex: "#9F9F9F"), thumbsdownColor: Color(hex: "#9F9F9F"),
                                    seperateLineColor: Color(hex: "#3BB0BA"), isUpgradeable: false, item: item)
//                            TextBox(text: item.title, textColor: Color(hex: "#FAF5E4"), boxColor: Color(hex: "#F2A970"),
//                                boxOpacity: 1, thumbsupColor: Color(hex: "#B39283"), thumbsupNumColor: Color(hex: "#CFB997"),
//                                thumbsdownNumColor: Color(hex: "#C23B22"), thumbsdownColor: Color(hex: "#C23B22"),
//                                seperateLineColor: Color(hex: "#3BB0BA"), isUpgradeable: false, item: item)
                                /*.environmentObject(self.observedObj)*/
                            }
                        }
                    }
                        .offset(y: searchBarHeight)
                        .padding([.bottom],searchBarHeight)
                    Button(action: self.observedObj.loadMoreItems) {
                        Text("Load More")
                    }
                        .padding(30)
//                        .padding(.bottom, searchBarHeight)
                }

                VStack {

                    HStack {
                        AuthenticationTextField(text: $observedObj.searchText, placeHolder: "Search #'s", onCommit: observedObj.searchTag)
                            .overlay(
                                GeometryReader() { geo in
                                    Color(.clear)
                                        .onAppear {
                                            self.searchBarHeight = geo.size.height
                                        }
                                }
                            )

                        Button(action: {

                            self.observedObj.shouldReloadTheFullList = true

                            func resetLastEvaluateKeys() {
                                self.observedObj.lastEvaluateNonupgradedItem.id = ""
                                self.observedObj.lastEvaluateUpgradedItem.id = ""
                            }

                            if self.observedObj.sortedBy == .latest {
                                /*exp: Since the list is going to update from scratch I have to set lastEvaluatedKey to nil so the will update instead of extend*/
                                resetLastEvaluateKeys()
                                self.observedObj.sortedBy = .mostLiked
                            } else if self.observedObj.sortedBy == .mostLiked {
                                resetLastEvaluateKeys()
                                self.observedObj.sortedBy = .mostDisliked
                            } else {
                                self.observedObj.sortedBy = .latest
                                resetLastEvaluateKeys()
                            }

                            self.observedObj.runQuery()

                        }) {
                            if observedObj.sortedBy == .latest {
                                Text("latest")
                                    .modifier(SortText())
                            } else if observedObj.sortedBy == .mostLiked {
                                Text("Most Liked")
                                    .modifier(SortText())
                            } else {
                                Text("Most Disliked")
                                    .modifier(SortText())
                            }

                        }

                    }
//                        .background(Color(hex: "#FAF5E4"))
                        .opacity(0.95)
//                        .overlay(
//                            Color(hex: "#FAF5E4")
//                                .opacity(0.95)
//                                .offset(x: 0, y: -self.searchBarHeight)
//                        )

                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
//                self.observedObj.fetchCurrentAuthSession()
//                self.observedObj.runQuery()

//            TODO: Uncomment this line(commented for design test)
                if homeViewNetworking.isUserSignedInVar {
                    self.observedObj.runQuery()
                }
            }
    }
}


struct SortText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, design: .rounded))
            .foregroundColor(Color(hex:"#3BB0BA"))
            .padding(.trailing, 15)
    }
}
