//
//  UpgradeToggle.swift
//  X
//
//  Created by Aria Zare on 3/15/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct ToggleImage: View
{
    @Binding var isOn: Bool
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Image(systemName: isOn ? "\(imageName).fill" : imageName)
            .onTapGesture {
                self.isOn = !self.isOn
                self.action()
            }
    }
}
