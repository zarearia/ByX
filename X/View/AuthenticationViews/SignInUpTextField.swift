//
//  SignInUpTextField.swift
//  X
//
//  Created by Aria Zare on 3/11/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct SignInUpTextField: View {

    @Binding var text: String
    var placeHolder: String
    var onCommit: (() -> Void)?

    var body: some View {
        VStack {
            TextField(placeHolder, text: $text, onCommit: dismissKeyboardAndOnCommit)
                .font(.system(size: 23, design: .rounded))
                .foregroundColor(.gray)
                .padding(.leading, 5)
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 2)
        }
            .padding()
    }
    
    func dismissKeyboardAndOnCommit() -> Void {
        (onCommit ?? emptyFunc)()
        UIApplication.shared.endEditing()
    }
    func emptyFunc() -> Void {
    }
}

