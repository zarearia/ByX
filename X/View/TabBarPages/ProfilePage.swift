//
//  ProfilePage.swift
//  X
//
//  Created by Aria Zare on 3/14/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    
    @ObservedObject var observedObj = HomeViewNetworking()
    
    var body: some View {
        ZStack {
            Color(hex: "#FAF5E4")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("My Posts")
                            .foregroundColor(Color(hex: "#E8824F"))
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color(hex: "#E8824F"))
                                .font(.system(size: 35, weight: .regular, design: .rounded))
                                .padding(.top, 5)
                                .padding(.trailing, 20)
                        }
                    }
                    
                    
                    Rectangle()
                        .foregroundColor(Color(hex: "#E8824F"))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 2)
                        .padding([.leading, .trailing], 5)
                }
                
                ScrollView {
                    ForEach(observedObj.listItems, id: \.self.id) { item in
                        TextBox(text: item.title, textColor: Color(hex: "#FAF5E4"), boxColor: Color(hex: "#3BB0BA"), boxOpacity: 0.9, thumbsupColor: Color(hex: "#B39283"), thumbsupNumColor: Color(hex: "#B39283"), thumbsdownNumColor: Color(hex: "#C23B22"), thumbsdownColor: Color(hex: "#C23B22"), seperateLineColor: Color(hex: "#3BB0BA"), isUpgradeable: true, item: item)
                    }

                    Spacer()
                }
            }
        }
        .onAppear {
            self.observedObj.userPosterItemsQuery()
        }
    }
}
