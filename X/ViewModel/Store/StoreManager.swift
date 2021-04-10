//
// Created by Aria Zare on 11/16/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import StoreKit

class StoreManager: NSObject {

    var productIdentifiers = [String]()
    
    fileprivate var productRequest: SKProductsRequest!

    fileprivate var availableProducts = [SKProduct]()

    fileprivate var invalidProductIdentifiers = [String]()

    var isAuthorizedForPayments: Bool {
        return SKPaymentQueue.canMakePayments()
    }

    static let shared = StoreManager()

    private override init() {
        super.init()

    }

    func startProductRequest() {
        initializeProductIdentifiers()
        fetchProducts()
    }

    fileprivate func initializeProductIdentifiers() {
        guard let url = Bundle.main.url(forResource: "product_ids", withExtension: "plist") else { fatalError("Unable to resolve url for in the bundle.") }
        do {
            let data = try Data(contentsOf: url)
            let productIdentifiers = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String]
            self.productIdentifiers = productIdentifiers!
        } catch let error as NSError {
            print("error initiating products: \(error.localizedDescription)")
        }
    }

    fileprivate func fetchProducts() {
        
        let productIdentifiersSet = Set(self.productIdentifiers)

        productRequest = SKProductsRequest(productIdentifiers: productIdentifiersSet)
        productRequest.delegate = self

        print("Here")

        productRequest.start()
    }

    
}

extension StoreManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

        print("SKDelegate excuted")

        if !response.products.isEmpty {
            availableProducts = response.products
        }

        if !response.invalidProductIdentifiers.isEmpty {
            invalidProductIdentifiers = response.invalidProductIdentifiers
        }

        print("*****************\n available product IDs: \n \(availableProducts) \n *****************")
        print("*****************\n invalid Product Identifiers: \n \(invalidProductIdentifiers) \n *****************")
    }

}

extension SKProduct {
    var regularPrice: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        return formatter.string(from: self.price)
    }
}