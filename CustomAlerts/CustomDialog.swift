//
//  CustomDialog.swift
//  CustomAlerts
//
//  Created by RJ Hrabowskie on 2/15/25.
//

import SwiftUI

struct CustomDialog: View {
    var title: String
    var content: String?
    var image: Config
    var primaryButton: Config
    var secondaryButton: Config?
    var addsTextField: Bool = false
    var textFieldHint: String = ""
    
    @State private var text: String = ""
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: image.content)
                .font(.title)
                .foregroundStyle(image.foreground)
                .frame(width: 65, height: 65)
                .background(image.tint.gradient, in: .circle)
                .background {
                    Circle()
                        .stroke(.background, lineWidth: 8)
                }
            
            Text(title)
                .font(.title3.bold())
            
            if let content {
                Text(content)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundStyle(.gray)
                    .padding(.vertical, 4)
            }
            
            if addsTextField {
                TextField(textFieldHint, text: $text)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.1))
                    }
                    .padding(.bottom, 5)
            }
            
            ButtonView(primaryButton)
            
            if let secondaryButton {
                ButtonView(secondaryButton)
                    .padding(.top, -5)
            }
        }
        .padding([.horizontal, .bottom], 15)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
                .padding(.top, 30)
        }
        .frame(maxWidth: 310)
        .compositingGroup()
    }
    
    @ViewBuilder
    private func ButtonView(_ config: Config) -> some View {
        Button {
            config.action(addsTextField ? text : "")
        } label: {
            Text(config.content)
                .fontWeight(.bold)
                .foregroundStyle(config.foreground)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(config.tint.gradient, in: .rect(cornerRadius: 10))
        }
    }
    
    struct Config {
        var content: String
        var tint: Color
        var foreground: Color
        var action: (String) -> () = { _ in }
    }
}
