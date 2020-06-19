//
//  AdminPanelTextBar.swift
//  X
//
//  Created by Aria Zare on 4/20/20.
//  Copyright © 2020 Aria Zare. All rights reserved.
//

import SwiftUI
import AWSAppSync

struct AdminPanelTextBar: View {

    var appSyncClient: AWSAppSyncClient?
    var title: String
    var id: String

    @State var approveButtonString = "approve"
    @State var disapproveButtonString = "disapprove"

    public init(id: String, title: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.appSyncClient = appDelegate.appSyncClient

        self.title = title
        self.id = id
    }

    var body: some View {
        VStack(alignment: .leading) {

            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .padding()
                        .foregroundColor(Color(hex: "#FAF5E4"))
                    Spacer()
                }
            }
                .fixedSize(horizontal: false, vertical: true)
                .background(Color(hex: "#F2A970"))
                .cornerRadius(23)
                .padding()

            HStack {

                Spacer()

                Button(action: {
                    self.approvalMutation(accepted: true)
                }) {
                    Text(approveButtonString)
                        .foregroundColor(.white)
                        .bold()
                }
                    .padding()
                    .background(Color(hex: "#3BB0BA"))
                    .cornerRadius(15)

                Spacer()

                Button(action: {
                    self.approvalMutation(accepted: false)
                }) {
                    Text(disapproveButtonString)
                        .foregroundColor(.white)
                        .bold()
                }
                    .padding()
                    .background(Color(hex: "#B61A0E"))
                    .cornerRadius(15)

                Spacer()
            }

            Rectangle()
                .foregroundColor(Color(hex: "#3BB0BA"))
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 2)
                .padding(5)

        }
    }

    func approvalMutation(accepted: Bool) {

        appSyncClient?.perform(mutation: AdminChangeXModelTypeMutation(id: id, accept: accepted)) { (resulte, error) in
            if let error = error as? AWSAppSyncClientError {
                print("Error occurred: \(error.localizedDescription )")
            }

            print("admin \(accepted) mutation complete.")

            if accepted {
                self.approveButtonString = "approved"
            } else {
                self.disapproveButtonString = "disapproved"
            }
        }
    }
}
