//
//  CreditsView.swift
//  Africa
//
//  Created by Denis Yaremenko on 31.03.2024.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128
                )
            Text(
                """
                Copyright c Denis Remen
                All rights reserved
                Better apps heart ♡ less code
                """
            )
            .font(.footnote)
        .multilineTextAlignment(.center)
        }//: VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Preview: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

#Preview {
    CreditsView()
}
