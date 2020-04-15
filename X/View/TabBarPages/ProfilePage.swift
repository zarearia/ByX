//
//  ProfilePage.swift
//  X
//
//  Created by Aria Zare on 3/14/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    
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
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("My Posts")
                            .foregroundColor(Color(hex: "#E8824F"))
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color(hex: "#E8824F"))
                                .font(.system(size: 35, weight: .regular, design: .rounded))
                                .padding(.top, 5)
                                .padding(.trailing, 20)
                        }
                    }
                    
                    
                    Rectangle()
                        .foregroundColor(Color(hex: "#E8824F"))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 2)
                        .padding([.leading, .trailing], 5)
                }
                
                ScrollView {
                    ForEach(designTestTexts) { item in
//                        TextBox(text: item.title, textColor: Color(hex: "#FAF5E4"), boxColor: Color(hex: "#F2A970"), boxOpacity: 1, thumbsupColor: Color(hex: "#E8824F"), thumbsupNumColor: Color(hex: "#E8824F"), thumbsdownNumColor: Color(hex: "#E8824F"), thumbsdownColor: Color(hex: "#E8824F"), seperateLineColor: Color(hex: "#3BB0BA"), isUpgradeable: true, item: item)
                        Text("Hello World")
                    }

                    Spacer()
                }
            }
        }
    }
}
