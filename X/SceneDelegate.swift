//
//  SceneDelegate.swift
//  X
//
//  Created by Aria Zare on 3/11/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import UIKit
import SwiftUI
import FBSDKCoreKit
import AuthenticationServices

let userEmailKey = "userEmailKey"
let userPasswordKey = "userPasswordKey"

let homeViewNetworking = HomeViewNetworking()
let userDefaults = UserDefaults.standard
let null_dateTime = "2000-01-01T01:01:01.000000z"//"2019-02-06T00:35:01.746Z"

let thirdPartyRegisteredUsersToken = "kjSFaas721nf"


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?



    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

    // Create the SwiftUI view that provides the window contents.
//        homeViewNetworking.fetchCurrentAuthSession()
//        homeViewNetworking.runQuery()
//        homeViewNetworking.userPosterItemsQuery()
        print(userDefaults.value(forKey: userEmailKey))
        if let userEmail = userDefaults.value(forKey: userEmailKey) {
            homeViewNetworking.userEmail = userEmail as? String ?? ""
        }
        if let userPassword = userDefaults.value(forKey: userPasswordKey) {
            homeViewNetworking.userPassword = userPassword as? String ?? ""
        }
        if let token = userDefaults.value(forKey: "token") {
            homeViewNetworking.token = token as? String ?? ""
        }

        let contentView = TabBar().environmentObject(homeViewNetworking)


        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    /*Mark: FaceBook*/
    /****************************/

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }

        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
    /****************************/


    func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }


    func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }


    func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
    }


    func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
    }


    func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
    }



}

//MARK: providing Apple Sign In the window
extension SceneDelegate: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        if let window = self.window {
            return window
        } else {
            fatalError("Main UIWindow is empty")
        }
    }
}
