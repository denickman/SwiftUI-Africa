//
//  CoverImageView.swift
//  Africa
//
//  Created by Denis Yaremenko on 26.03.2024.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - Properties
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    // MARK: - Body
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            } //: ForEach
        }//: Tab
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
