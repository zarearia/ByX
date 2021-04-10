//
//  AppDelegate.swift
//  X
//
//  Created by Aria Zare on 3/11/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import UIKit
import AWSAppSync
import FBSDKCoreKit
import StoreKit



// Swift
//
// AppDelegate.swift

//import UIKit
//import FBSDKCoreKit
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//
//        ApplicationDelegate.shared.application(
//            application,
//            didFinishLaunchingWithOptions: launchOptions
//        )
//
//        return true
//    }
//
//    func application(
//        _ app: UIApplication,
//        open url: URL,
//        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
//    ) -> Bool {
//
//        ApplicationDelegate.shared.application(
//            app,
//            open: url,
//            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
//        )
//
//    }
//
//}






let urlSessionConfiguration = URLSessionConfiguration.default

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var appSyncClient: AWSAppSyncClient?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {


        SKPaymentQueue.default().add(StoreObserver.shared)
        StoreManager.shared.startProductRequest()


        
        /*Mark: Facebook*/
        /*************************/
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        /*************************/
        
        
        
    // Override point for customization after application launch.
        do {
            // Header
//            let urlSessionConfiguration = URLSessionConfiguration.default
            if let token = userDefaults.value(forKey: "token") {
                urlSessionConfiguration.httpAdditionalHeaders = ["token": token as! String]
            } else {
                urlSessionConfiguration.httpAdditionalHeaders = ["token": ""]
            }
//            userDefaults.set("xappemailtest2020@gmail.com", forKey: userEmailKey)
//            userDefaults.set("123456789", forKey: userEmailKey)

//            eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InhhcHBlbWFpbHRlc3QyMDIwQGdtYWlsLmNvbSJ9.iB8bTlPF7wotCLkvJAsOyHpFNEx4gkgJ1215qF4nR54

            // You can choose the directory in which AppSync stores its persistent cache databases
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()

            // AppSync configuration & client initialization
            let appSyncServiceConfig = try AWSAppSyncServiceConfig()
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: appSyncServiceConfig,
                urlSessionConfiguration: urlSessionConfiguration, cacheConfiguration: cacheConfiguration)
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            print("Initialized appsync client.")
        } catch {
            print("Error initializing appsync client. \(error)")
        }


        return true
    }

    func reconfigureAppSyncClient(actionAfterExcution: (() -> Void)) {
        do {
            // Header
//            let urlSessionConfiguration = URLSessionConfiguration.default
            if let token = userDefaults.value(forKey: "token") {
                urlSessionConfiguration.httpAdditionalHeaders = ["token": token as! String]
            } else {
                urlSessionConfiguration.httpAdditionalHeaders = ["token": ""]
            }
//            eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InhhcHBlbWFpbHRlc3QyMDIwQGdtYWlsLmNvbSJ9.iB8bTlPF7wotCLkvJAsOyHpFNEx4gkgJ1215qF4nR54

            // You can choose the directory in which AppSync stores its persistent cache databases
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()

            // AppSync configuration & client initialization
            let appSyncServiceConfig = try AWSAppSyncServiceConfig()
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: appSyncServiceConfig,
                urlSessionConfiguration: urlSessionConfiguration, cacheConfiguration: cacheConfiguration)
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            print("Initialized appsync client.")

            actionAfterExcution()

        } catch {
            print("Error initializing appsync client. \(error)")
        }
    }
    
          
    /*Mark: Facebook*/
    /*************************/
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
    }
    
    /*************************/


    // MARK: UISceneSession Lifecycle


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }


    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func applicationWillTerminate(_ application: UIApplication) {

        SKPaymentQueue.default().remove(StoreObserver.shared)
    }
}
