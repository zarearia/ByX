//
//  AddPage.swift
//  X
//
//  Created by Aria Zare on 3/14/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI
import Combine

//MARK: Test
/********************************************************************************/
//final class UserData: ObservableObject  {
//    let didChange = PassthroughSubject<UserData, Never>()
//
//    var text: String {
//        didSet {
//            didChange.send(self)
//        }
//    }
//
//    init(text: String) {
//        self.text = text
//    }
//}

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
//        view.isScrollEnabled = true
//        view.isEditable = true
//        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor(hex: "#3BB0BA")
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
/********************************************************************************/

struct AddPage: View {
    
    @ObservedObject var observedObj = AddPageNetworking()
    @State var isEditing = false
//    @State var textFieldsTestText = ""
//    @State var isUpgaraded = false

    var body: some View {

        GeometryReader { geo in
            Color(hex: "#FAF5E4")
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Hi X, what's going through your mind right now?")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding()
                    .foregroundColor(Color(hex: "#E8824F"))

                ZStack {
                    Color(hex: "#3BB0BA")
                        .cornerRadius(25)

                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(self.observedObj.textFieldsText.count)/128")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(self.observedObj.textFieldsText.count < 129 ? Color(hex: "#FAF5E4") : Color.red)
                            Spacer()
                        }
                            .padding(.leading, 20)
                            .padding([.top, .bottom], 7)

//                        MultilineTextView(text: self.$observedObj.textFieldsText)
                        TextView(text: self.$observedObj.textFieldsText, isEditing: self.$isEditing)
//                        TextField("Tap to start writing", text: self.$observedObj.textFieldsText)
//                            .lineLimit(30)
//                            .foregroundColor(Color(hex: "#FAF5E4"))
//                            .font(.system(size: 20, weight: .bold, design: .rounded))
//                            .multilineTextAlignment(.leading)
//                            .fixedSize(horizontal: false, vertical: true)
                            .padding([.leading, .trailing])

                        Spacer()
                       
                        HStack {
                            TextField("Tag", text: self.$observedObj.firstTag)
                                .modifier(TagTextFieldModifier())
                            TextField("Tag", text: self.$observedObj.secondTag)
                                .modifier(TagTextFieldModifier())
                                .opacity(self.observedObj.firstTag == "" ? 0.5 : 1)
                                .disabled(self.observedObj.firstTag == "" ? true : false)
                            TextField("Tag", text: self.$observedObj.thirdTag)
                                .modifier(TagTextFieldModifier())
                                .opacity(self.observedObj.secondTag == "" ? 0.5 : 1)
                                .disabled(self.observedObj.secondTag == "" ? true : false)
                            TextField("Tag", text: self.$observedObj.forthTag)
                                .modifier(TagTextFieldModifier())
                                .opacity(self.observedObj.thirdTag == "" ? 0.5 : 1)
                                .disabled(self.observedObj.thirdTag == "" ? true : false)
                            TextField("Tag", text: self.$observedObj.fifthTag)
                                .modifier(TagTextFieldModifier())
                                .opacity(self.observedObj.forthTag == "" ? 0.5 : 1)
                                .disabled(self.observedObj.forthTag == "" ? true : false)
                        }
                            .padding(.leading, 20)
                            .padding([.top, .bottom], 15)
                       
                    }
                }
                    .frame(height: geo.size.height / 2)
                    .padding([.trailing, .leading, .bottom])

                HStack {
                    Spacer()
                    Text("Upgrade")
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(Color(hex: "#E8824F"))
                        
                    ToggleImage(isOn: self.$observedObj.isUpgraded, imageName: "star", action: self.mbdTest)
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .foregroundColor(Color(hex: "#E8824F"))
                }
                    .padding()
                    .padding(.trailing, 15)

                Button(action: {
                    self.observedObj.runMutation()
                }) {
                    AuthenticationButton(text: "Post", screenWidth: geo.size.width)
                }
                    .allowsHitTesting(self.observedObj.textFieldsText.count <= 128)
                    .padding()

            }
        }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
    }
    
    func mbdTest()
    {
        print("mbd")
    }
}

struct TagTextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(hex: "#FAF5E4"))
            .font(.system(size: 20, weight: .bold, design: .rounded))
    }
}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
