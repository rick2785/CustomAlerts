//
//  ContentView.swift
//  CustomAlerts
//
//  Created by RJ Hrabowskie on 2/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showTextFieldAlert = false
    @State private var showDialogAlert = false
    @State private var showAlert = false
    var body: some View {
        NavigationStack {
            List {
                Button("TextField Alert") {
                    showTextFieldAlert.toggle()
                }
                .alert(isPresented: $showTextFieldAlert) {
                    CustomDialog(
                        title: "Folder Name",
                        content: "Enter a file Name",
                        image: .init(content: "folder.fill.badge.plus", tint: .blue, foreground: .white),
                        primaryButton: .init(content: "Save Folder", tint: .blue, foreground: .white, action: { folder in
                            print(folder)
                            showTextFieldAlert = false
                        }),
                        secondaryButton: .init(content: "Cancel", tint: .red, foreground: .white, action: { _ in
                            showTextFieldAlert = false
                        }),
                        addsTextField: true,
                        textFieldHint: "Personal Documents"
                    )
                    .transition(.blurReplace.combined(with: .push(from: .bottom)))
                } background: {
                    Rectangle()
                        .fill(.primary.opacity(0.35))
                }
                
                Button("Dialog Alert") {
                    showDialogAlert.toggle()
                }
                .alert(isPresented: $showDialogAlert) {
                    CustomDialog(
                        title: "Replace Existing File",
                        content: "This will rewrite the existing file with the new file content.",
                        image: .init(content: "questionmark.folder.fill", tint: .blue, foreground: .white),
                        primaryButton: .init(content: "Replace", tint: .blue, foreground: .white, action: { folder in
                            print(folder)
                            showDialogAlert = false
                        }),
                        secondaryButton: .init(content: "Cancel", tint: Color(.tertiarySystemFill), foreground: .primary, action: { _ in
                            showDialogAlert = false
                        })
                    )
                    .transition(.blurReplace.combined(with: .push(from: .bottom)))
                } background: {
                    Rectangle()
                        .fill(.primary.opacity(0.35))
                }
                
                Button("Alert") {
                    showAlert.toggle()
                }
                .alert(isPresented: $showAlert) {
                    CustomDialog(
                        title: "Application Error",
                        content: "There was an error while saving your file. \nPlease try again later",
                        image: .init(content: "exclamationmark.triangle.fill", tint: .blue, foreground: .white),
                        primaryButton: .init(content: "Done", tint: .red, foreground: .white, action: { _ in
                            showAlert = false
                        })
                    )
                    .transition(.blurReplace.combined(with: .push(from: .bottom)))
                } background: {
                    Rectangle()
                        .fill(.primary.opacity(0.35))
                }
            }
            .navigationTitle("Custom Alert")
        }
        
    }
}

#Preview {
    ContentView()
}
