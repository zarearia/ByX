//
// Created by Aria Zare on 11/16/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import StoreKit

class StoreObserver: NSObject, SKPaymentTransactionObserver {

    static let shared = StoreObserver()

    private override init() {
        super.init()
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

    }

}
