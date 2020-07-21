//
// Created by Aria Zare on 7/21/20.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import SwiftUI
import UIKit
import SwipeView

struct SwipeablePageView: UIViewRepresentable {

    @EnvironmentObject var enviromentObject: HomeViewNetworking
    var currentItem: ListXModelTypesQuery.Data.ListXModelType.Item

    class Coordinator: NSObject, SwipeViewDelegate, SwipeViewDataSource {

        let parent: SwipeablePageView

        init(_ parent: SwipeablePageView) {
            self.parent = parent;
        }

        func numberOfItems(in swipeView: SwipeView!) -> Int {
            parent.enviromentObject.listItems.count
        }

        func swipeView(_ swipeView: SwipeView!, viewForItemAt index: Int, reusing view: UIView!) -> UIView! {
            let textBox = UIHostingController(rootView: TextBox(text: parent.enviromentObject.listItems[index].title,
                textColor: Color(hex: "#FAF5E4"), boxColor: Color(hex: "#F2A970"), boxOpacity: 1,
                thumbsupColor: Color(hex: "#B39283"), thumbsupNumColor: Color(hex: "#CFB997"),
                thumbsdownNumColor: Color(hex: "#C23B22"), thumbsdownColor: Color(hex: "#C23B22"),
                seperateLineColor: Color(hex: "#3BB0BA"), isUpgradeable: false,
                item: parent.enviromentObject.listItems[index]).environmentObject(self.parent.enviromentObject))
            textBox.view.frame = UIScreen.main.bounds
            return textBox.view
        }


    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> SwipeablePageUIView {
        let swipeView = SwipeablePageUIView(frame: UIScreen.main.bounds)
        swipeView.swipeView.delegate = context.coordinator
        swipeView.swipeView.dataSource = context.coordinator

        swipeView.goToItem(at: enviromentObject.listItems.firstIndex{ $0.id == currentItem.id} ?? 0 )
        return swipeView
    }

    func updateUIView(_ uiView: SwipeablePageUIView, context: Context) {
    }

    static func dismantleUIView(_ uiView: UIViewType, coordinator: ()) {
        
    }
}


class SwipeablePageUIView: UIView {

    let swipeView = SwipeView()

    required init?(coder: NSCoder) {
        fatalError("SwipeablePageUIView: Story board isn't supported")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        /*TODO: SwipeView to UIView Constraints instead of frame*/
        swipeView.frame = frame

        self.addSubview(swipeView)
    }

    func goToItem(at index: Int) {
        swipeView.scrollToItem(at: index, duration: TimeInterval.zero)
    }

}

