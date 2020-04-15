//
//  AuthenticationButton.swift
//  X
//
//  Created by Aria Zare on 3/11/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct AuthenticationButton: View {

    var text: String
//    var action: (() -> Void)
    var screenWidth: CGFloat

    public init(text: String, screenWidth: CGFloat) {
        self.text = text
//        self.action = action
        self.screenWidth = screenWidth
    }

    var body: some View {
        Text(self.text)
            .font(.system(size: 18, design: .rounded))
            .fontWeight(.semibold)
            .frame(minWidth: 0, maxWidth: screenWidth / 1.3)
            .frame(minHeight: 0, maxHeight: screenWidth / 5.5)
            .background(Color(hex: "#F2A970"))
            .foregroundColor(Color(hex: "#FAF5E4"))
            .cornerRadius(screenWidth / 2)
    }
}