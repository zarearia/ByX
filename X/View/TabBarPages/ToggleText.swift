//
//  ToggleText.swift
//  X
//
//  Created by Aria Zare on 4/14/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct ToggleText: View {
    @Binding var isOn: Bool
    var onText: String
    var offText: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.isOn = !self.isOn
            self.action()
        }, label: {
            Text( isOn ? onText : offText)
            .font(.system(size: 18, weight: .medium, design: .rounded))
            .foregroundColor(.red)
            .offset(y: 5)
        })
    }
}
