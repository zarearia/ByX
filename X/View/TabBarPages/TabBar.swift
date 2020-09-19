//
//  TabBar.swift
//  X
//
//  Created by Aria Zare on 3/13/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    
    @State var testBool = false

    @EnvironmentObject var environmentObject: HomeViewNetworking

    var body: some View {

        ZStack {
            if (!self.environmentObject.isUserSignedIn) {
                FirstPage()
            } else {

                TabView {
                    HomePage().environmentObject(environmentObject)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }.tag(0)
                    AddPage()
                        .tabItem {
                            Image(systemName: "plus.circle.fill")
                            Text("Add")
                        }.tag(1)
                    ProfilePage().environmentObject(environmentObject)
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Profile")
                        }.tag(2)
                    AdminPanelPage()
                        .tabItem {
                            Image(systemName: "person.3.fill")
                            Text("Admin Panel")
                        }.tag(3)
                }
            }
        }
//        .onAppear {
//            self.environmentObject.fetchCurrentAuthSession()
//        }
//            .edgesIgnoringSafeArea(.top)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}










