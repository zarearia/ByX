//
//  ProfilePage.swift
//  X
//
//  Created by Aria Zare on 3/14/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    
    @EnvironmentObject var observedObj: HomeViewNetworking

    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        ZStack {
//            Color(hex: "#FAF5E4")
//                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("My Posts")
                            .foregroundColor(Color(hex: "#6CAF26"))
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color(hex: "#6CAF26"))
                                .font(.system(size: 35, weight: .regular, design: .rounded))
                                .padding(.top, 5)
                                .padding(.trailing, 20)
                        }
                    }

                    HStack {

                        Spacer()

                        VStack {
                            Text("Posts")
                                .font(.system(size: 25, design: .rounded))
                                .bold()
                                .padding()
                                .foregroundColor(Color(hex: "#6CAF26"))

                            Text(String(observedObj.upgradedCount()))
                                .font(.system(size: 22, design: .rounded))
                                .foregroundColor(Color(hex: "#6CAF26"))

                        }
                            .padding()

                        Spacer()

                        VStack {
                            Text("Upgraded")
                                .font(.system(size: 25, design: .rounded))
                                .bold()
                                .padding()
                                .foregroundColor(Color(hex: "#6CAF26"))

                            Text(String(observedObj.nonupgradedCount()))
                                .font(.system(size: 22, design: .rounded))
                                .foregroundColor(Color(hex: "#6CAF26"))
                        }
//                            .padding()

                        Spacer()
                    }
                    
                    
                    Rectangle()
                        .foregroundColor(Color(hex: "#6CAF26"))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 2)
                        .padding([.leading, .trailing], 5)
                }
                
                List {
                    ForEach(observedObj.listItems, id: \.self.id) { item in
//                        TextBox(text: item.title, textColor: Color(hex: "#FAF5E4"), boxColor: Color(hex: "#3BB0BA"),
//                            boxOpacity: 0.9, thumbsupColor: Color(hex: "#B39283"), thumbsupNumColor: Color(hex: "#B39283"),
//                            thumbsdownNumColor: Color(hex: "#C23B22"), thumbsdownColor: Color(hex: "#C23B22"),
//                            seperateLineColor: Color(hex: "#3BB0BA"), isUpgradeable: true, item: item)
                        TextBox(text: item.title, textColor: Color(.white), boxColor: Color(hex: "#4891E1"),
                            boxOpacity: 1, thumbsupColor: Color(hex: "#4891E1"), thumbsupNumColor: Color(hex: "#4891E1"),
                            thumbsdownNumColor: Color(hex: "#9F9F9F"), thumbsdownColor: Color(hex: "#9F9F9F"),
                            seperateLineColor: Color(hex: "#3BB0BA"), isUpgradeable: true, item: item)
                            .environmentObject(self.observedObj)
                    }
                        .onDelete(perform: delete)
                        .padding([.leading, .trailing], -20)

                    Spacer()
                }
            }
        }
        .onAppear {
//            self.observedObj.userPosterItemsQuery()
        }
    }

    func delete(at offsets: IndexSet) {
    /*********************************************************************/
        if let index = offsets.first {
            let item = observedObj.listItems[index]
            observedObj.listItems.remove(atOffsets: offsets)
            if !observedObj.deleteItem(item: item) {
        //        TODO: Change this part(apply failed to delete logic)
                observedObj.listItems.insert(item, at: index)
            }
        }
    }

}
