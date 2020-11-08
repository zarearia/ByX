//
// Created by Aria Zare on 11/8/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI

struct ApplePayPage: View {

//    TODO: does payment Items need to be dynamic?
//    let paymentItems = []

    var body: some View {
        List{
            ForEach(0..<3) { _ in
                Section(header: Text("section")) {
                    ForEach(0..<7) { _ in
                        Text("50 Coupens")
                    }
                }
            }
        }
            .listStyle(GroupedListStyle())
    }
}
