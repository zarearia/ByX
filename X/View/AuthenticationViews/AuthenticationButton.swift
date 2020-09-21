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
    var action: (() -> Void)?
    var screenWidth: CGFloat


    var label: some View {
        Text(self.text)
            .font(.system(size: 23, design: .rounded))
            .fontWeight(.semibold)
            .frame(minWidth: 0, maxWidth: screenWidth / 1.3)
            .frame(minHeight: 0, maxHeight: screenWidth / 5.5)
//            .background(Color(hex: "#F2A970"))
            .background(Color(hex: "#4891E1"))
            .foregroundColor(.white)
            .cornerRadius(5)
            .shadow(color: Color(hex: "#414141"),radius: 6, x: 2, y: 3)
    }


    public init(text: String, screenWidth: CGFloat, action: @escaping () -> Void) {
        self.text = text
        self.action = action
        self.screenWidth = screenWidth
    }

    public init(text: String, screenWidth: CGFloat) {
        self.text = text
        self.screenWidth = screenWidth
    }

    var body: some View {
        Button(action: {
            (self.action ?? self.empty)()
        }) {
            label
        }
    }

    func empty() -> Void {

    }
}