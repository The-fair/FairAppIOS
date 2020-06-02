//
//  LabelledDivider.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/1/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

struct ButtonStyle: ViewModifier {

    private let color: Color
    private let enabled: () -> Bool
    init(color: Color, enabled: @escaping () -> Bool = { true }) {
        self.color = color
        self.enabled = enabled
    }

    dynamic func body(content: Content) -> some View {
        content
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .foregroundColor(Color.white)
            .background(enabled() ? color : Color.black)
            .cornerRadius(5)
    }
}

extension View {
    dynamic func buttonStyleEmerald(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.emerald, enabled: enabled))
    }

    dynamic func buttonStyleSaphire(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.forest, enabled: enabled))
    }

}

extension Color {
    static var emerald:     Color { .rgb(036, 180, 126) }
    static var forest:      Color { .rgb(062, 207, 142) }
}

extension Color {
    static func rgb(_ red: UInt8, _ green: UInt8, _ blue: UInt8) -> Color {
        func value(_ raw: UInt8) -> Double {
            return Double(raw)/Double(255)
        }
        return Color(
            red: value(red),
            green: value(green),
            blue: value(blue)
        )
    }
}
