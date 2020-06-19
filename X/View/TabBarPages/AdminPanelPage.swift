//
//  AdminPanel.swift
//  X
//
//  Created by Aria Zare on 3/16/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct AdminPanelPage: View {

    @ObservedObject var observedObj = HomeViewNetworking()
    @State var contentType = 0

    var body: some View {
        
        ZStack {

            Color(hex: "#FAF5E4")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {

                Picker(selection: $contentType, label: Text("Select the content type")) {
                    Text("Spam").tag(0)
                    Text("Reported").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onReceive([self.contentType].publisher.first()) { (value) in
                        if value == 0 {
                            self.observedObj.spamsQuery()
                        } else {
                            self.observedObj.reportedQuery()
                        }
                    }

                ForEach(observedObj.listItems, id: \.self.id) { item in
                    AdminPanelTextBar(id: item.id, title: item.title)
                }
            }
        }
            .onAppear {
                if self.contentType == 0 {
                    self.observedObj.spamsQuery()
                } else {
                    self.observedObj.reportedQuery()
                }
            }
    }
}
