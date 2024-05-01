//
//  CenterModifier.swift
//  Africa
//
//  Created by Denis Yaremenko on 31.03.2024.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
