//
// Created by Aria Zare on 6/19/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI
import UIKit
import SwipeView
import AWSAppSync


protocol SwipeViewParentUpdateDelegate {
    func updateListItems(_ sender: SwipeablePage)
}


struct SwipeablePageRepresentable: UIViewRepresentable {

//    @Binding var listItems: [ListXModelTypesQuery.Data.ListXModelType.Item]
    @EnvironmentObject var environmentObject: HomeViewNetworking
    var idOfCurrentItem: String


//    class Coordinator: NSObject, SwipeViewParentUpdateDelegate {
//        /*@Binding*/ var listItems: [ListXModelTypesQuery.Data.ListXModelType.Item]
//        init(listItems: /*Binding<*/[ListXModelTypesQuery.Data.ListXModelType.Item]/*>*/) {
//            self.listItems = listItems
//        }
//
//        func updateListItems(_ sender: SwipeablePage) {
//            print("coordinator update troggered")
//            listItems = sender.listItems
//            print(listItems[0].isLikedByTheUser)
//        }
//
////        @objc func listItemsChanged(_ sender: SwipeablePage) {
////            self.listItems = sender.listItems
////        }
//    }

//    func makeCoordinator() -> Coordinator {
//        return Coordinator(listItems: listItems)
//    }

    func makeUIView(context: Context) -> SwipeablePage {
        let swipeablePage = SwipeablePage(frame: UIScreen.main.bounds, numberOfItems: environmentObject.listItems.count,
            listItems: environmentObject.listItems)
//        swipeablePage.delegate = context.coordinator

        //TODO: Check this later, is it a right place to put this line of code???
        swipeablePage.goToItem(at: environmentObject.listItems.firstIndex{ $0.id == idOfCurrentItem} ?? 0 )
//        print("make excuted")
        return swipeablePage
    }

    func updateUIView(_ uiView: SwipeablePage, context: Context) {
//        environmentObject.listItems = uiView.listItems
//        uiView.listItems = listItems
        print("update excuted")
    }

//    static func dismantleUIView(_ uiView: UIViewType, coordinator: ()) {
//        print("deinited")
//    }
}


class SwipeablePage: UIView, SwipeViewDataSource, SwipeViewDelegate {

    let swipeView = SwipeView()
    var appSyncClient: AWSAppSyncClient?

    var delegate: SwipeViewParentUpdateDelegate?

    var listItems = [ListXModelTypesQuery.Data.ListXModelType.Item(id: "0", email: "12341234", title: "klanwfblawladk")]

    /*TODO: Change this*/
    var numberOfItems: Int = 1

    required init?(coder: NSCoder) {
        fatalError("StoryBoard unavailable")
    }

    init(frame: CGRect, numberOfItems: Int, listItems: [ListXModelTypesQuery.Data.ListXModelType.Item]) {
        super.init(frame: frame)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.appSyncClient = appDelegate.appSyncClient

        self.numberOfItems = numberOfItems
        self.listItems = listItems
        self.addSubview(swipeView)
        swipeView.dataSource = self
        swipeView.delegate = self
        swipeView.frame = self.frame
    }

    func numberOfItems(in swipeView: SwipeView!) -> Int {
        self.numberOfItems
    }

    func goToItem(at index: Int) {
        swipeView.scrollToItem(at: index, duration: TimeInterval.zero)
    }

    func swipeView(_ swipeView: SwipeView!, viewForItemAt index: Int, reusing view: UIView!) -> UIView! {

        let view = UIView(frame: self.frame)
        view.backgroundColor = .white

        let postView = UIView()
        postView.backgroundColor = .blue
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.layer.cornerRadius = 23
        view.addSubview(postView)

        /*exp: postView to view constraints*/
        let postViewToViewLeading = NSLayoutConstraint(item: postView, attribute: .leading, relatedBy: .equal,
            toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 15)
        let postViewToViewTop = NSLayoutConstraint(item: postView, attribute: .top, relatedBy: .equal, toItem: view,
            attribute: .topMargin, multiplier: 1, constant: 0)
        let postViewToViewTrailing = NSLayoutConstraint(item: postView, attribute: .trailing, relatedBy: .equal,
            toItem: view, attribute: .trailingMargin, multiplier: 1, constant: -15)
        let postViewToViewBottom = NSLayoutConstraint(item: postView, attribute: .bottom, relatedBy: .equal,
            toItem: view, attribute: .bottomMargin, multiplier: 1, constant: -250)


        let textLabel = UILabel()
        textLabel.text = listItems[index].title
        textLabel.backgroundColor = .cyan
        textLabel.sizeToFit()
        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        postView.addSubview(textLabel)

        /*exp: textLabel to postView constraints*/
        let textLabelToPostViewLeading = NSLayoutConstraint(item: textLabel, attribute: .leading, relatedBy: .equal,
            toItem: postView, attribute: .leadingMargin, multiplier: 1, constant: 15)
        let textLabelToPostViewTop = NSLayoutConstraint(item: textLabel, attribute: .top, relatedBy: .equal,
            toItem: postView, attribute: .topMargin, multiplier: 1, constant: 10)
        let textLabelToPostViewTrailing = NSLayoutConstraint(item: textLabel, attribute: .trailing, relatedBy: .equal,
            toItem: postView, attribute: .trailingMargin, multiplier: 1, constant: -15)
        let textLabelToPostViewBottom = NSLayoutConstraint(item: textLabel, attribute: .bottom, relatedBy: .lessThanOrEqual,
            toItem: postView, attribute: .bottomMargin, multiplier: 1, constant: -50)


        /*MARK: bottom bar design (like, dislike, report)*/
        let bottomStack = UIStackView()
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomStack)
        bottomStack.backgroundColor = .yellow

        /*exp: bottomStack to view constraints*/
        let bottomStackToViewLeading = NSLayoutConstraint(item: bottomStack, attribute: .leading, relatedBy: .equal,
            toItem: postView, attribute: .leadingMargin, multiplier: 1, constant: 15)
        let bottomStackToViewTop = NSLayoutConstraint(item: bottomStack, attribute: .top, relatedBy: .equal,
            toItem: postView, attribute: .bottomMargin, multiplier: 1, constant: -70)
        let bottomStackToViewTrailing = NSLayoutConstraint(item: bottomStack, attribute: .trailingMargin, relatedBy: .equal,
            toItem: postView, attribute: .trailingMargin, multiplier: 1, constant: -15)
        let bottomStackToViewBottom = NSLayoutConstraint(item: bottomStack, attribute: .bottom, relatedBy: .equal,
            toItem: postView, attribute: .bottomMargin, multiplier: 1, constant: -100)


        NSLayoutConstraint.activate([postViewToViewLeading, postViewToViewTop, postViewToViewTrailing,
                                     postViewToViewBottom, textLabelToPostViewLeading, textLabelToPostViewTop,
                                     textLabelToPostViewTrailing, textLabelToPostViewBottom, bottomStackToViewLeading,
                                     bottomStackToViewTop, bottomStackToViewTrailing, bottomStackToViewBottom])


        /*exp: buttons*/
        let likeButton = UIButtonWithAction(frame: CGRect(x: 0, y: 100, width: 50, height: 50)) {
            print("like exc")

//            disableAllHits()

            self.appSyncClient?.perform(mutation: LikeXModelTypeMutation(id: self.listItems[index].id, email: "zarearia@email.com")) { (result, error) in
                if let error = error as? AWSAppSyncClientError {
                    print("Error occurred: \(error.localizedDescription )")
                }

//            MARK: Is This Really Needed?
//            if let resultError = result?.errors {
//                print("Error saving the item on server: \(resultError)")
//                return
//            }

                print("Like mutation complete.")

                // updating the item
                self.appSyncClient?.fetch(query: GetXModelTypeQuery(id: self.listItems[index].id), cachePolicy: .fetchIgnoringCacheData) { (result, error) in
                    if error != nil {
                        print(error?.localizedDescription ?? "")
                        return
                    }

                    self.listItems[index].likesCount = (result?.data?.getXModelType?.likesCount!)

//                    self.manageHitableObjects()

                    self.listItems[index].isLikedByTheUser = !self.listItems[index].isLikedByTheUser!
                    self.delegate?.updateListItems(self)

                    print("Update query complete.")

                }
            }
        }
//        likeButton.translatesAutoresizingMaskIntoConstraints = true
        likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        view.addSubview(likeButton)
//        bottomStack.addSubview(likeButton)
//        likeButton.frame = CGRect(x: 0, y: 100, width: 50, height: 50)
        likeButton.addTarget(self, action: #selector(likeItem), for: .touchUpInside)











        let dislikeButton = UIButton()
//        dislikeButton.translatesAutoresizingMaskIntoConstraints = true
        dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
        view.addSubview(dislikeButton)
//        bottomStack.addSubview(dislikeButton)
        dislikeButton.frame = CGRect(x: 50, y: 100, width: 50, height: 50)
//        dislikeButton.addTarget(self, action: #selector(likeItem), for: .touchUpInside)

        let reportButton = UIButton()
//        reportButton.translatesAutoresizingMaskIntoConstraints = true
        reportButton.setTitle("Reported", for: .normal)
        reportButton.setTitleColor(.blue, for: .normal)
        view.addSubview(reportButton)
//        bottomStack.addSubview(reportButton)
        reportButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)

        return view
    }

    @objc func likeItem(sender: UIButtonWithAction) {
        sender.action()
    }


}


class UIButtonWithAction: UIButton {
    var action: (() -> Void)! = nil

    init(frame: CGRect, action: @escaping () -> Void) {
        super.init(frame: frame)
        self.action = action
    }

    required init?(coder: NSCoder) {
        fatalError("cannot create with storyboard")
    }
}