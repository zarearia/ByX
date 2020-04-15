//
//  AdminPanel.swift
//  X
//
//  Created by Aria Zare on 3/16/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct AdminPanelPage: View {
    
    var designTestTexts = [DesignTest(text: "Some text"),
                           DesignTest(text: "Any SwiftUI view can be partially or wholly transparent using the opacity() modifier. This accepts a value between 0 (completely invisible) and 1 "),
                           DesignTest(text: "Any SwiftUI view can be partially or wholly transparent using the opacity() modifier. This accepts a value between 0 (completely invisible) and 1 (fully opaque), just like the alpha property of UIView in UIKit."),
                           DesignTest(text: "Some text"),
                           DesignTest(text: "Any SwiftUI view can be partially or wholly transparent using the opacity() modifier. This accepts a value between 0 (completely invisible) and 1 "),
                           DesignTest(text: "Any SwiftUI view can be partially or wholly transparent using the opacity() modifier. This accepts a value between 0 (completely invisible) and 1 (fully opaque), just like the alpha property of UIView in UIKit.")]

    var body: some View {
        
        ZStack {

            Color(hex: "#FAF5E4")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                ForEach(designTestTexts) { item in
                    
                    VStack(alignment: .leading) {

                        HStack {
                            Text("Spam")
                                .foregroundColor(.red)
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .padding(.leading)
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.text)
                                    .padding()
                                    .foregroundColor(Color(hex: "#FAF5E4"))
                                Spacer()
                            }
                        }
                            .fixedSize(horizontal: false, vertical: true)
                            .background(Color(hex: "#F2A970"))
                            .cornerRadius(23)
                            .padding([.top, .leading, .trailing], 20)
                        
//                        HStack {
//                            Button
//                        }
                        
                        Rectangle()
                            .foregroundColor(Color(hex: "#3BB0BA"))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 2)
                            .padding(5)
                        
                    }
                    
                }
            }
        }
    }
}
