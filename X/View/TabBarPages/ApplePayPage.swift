//
// Created by Aria Zare on 11/8/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI

struct ApplePayPage: View {

//    TODO: does payment Items need to be dynamic?
//    let paymentItems = []
    let plans: [(couponCount: Int, price: Double)] = [(couponCount: 5, price: 2.49), (couponCount: 10, price: 4.99), (couponCount: 20, price: 9.99)]
//        [cou5: 2.49, 10: 4.99, 20: 9.99]
    let specialPlans: [(couponCount: Int, price: Double)] = [(couponCount: 50, price: 19.99), (couponCount: 75, price: 25.99), (couponCount: 100, price: 29.99)]
//        [50: 19.99, 75: 25.99, 100: 29.99]

    var body: some View {
        List{
//            ForEach(0..<1) { _ in
//                Section(header: Text("section")) {
//                    ForEach(0..<7) { _ in
//                        Text("50 Coupens")
//                    }
//                }
//            }
            Section(header: Text("Plans")) {
                ForEach(0..<plans.count) { item in
                    HStack {
                        Text("\(plans[item].0) Coupons")
                            .bold()

                        Spacer()
                        let price = makeTwoDigitFloats(num: plans[item].1)
                        Text("\(price)$")
                    }

                }
            }
            Section(header: Text("Special Plans")) {
                ForEach(0..<specialPlans.count) { item in
                    HStack {
                        Text("\(specialPlans[item].0) Coupons")
                            .bold()

                        Spacer()

                        let price = makeTwoDigitFloats(num: specialPlans[item].1)
                        Text("\(price)$")
                    }
                }
            }
        }
            .listStyle(GroupedListStyle())
    }

    func makeTwoDigitFloats(num: Double) -> String {
        String(format: "%.2f", num)
    }
}
