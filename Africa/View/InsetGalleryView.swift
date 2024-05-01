//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Denis Yaremenko on 26.03.2024.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // MARK: - Properties
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    let animal: Animal
    
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }//: Loop
            }//: HStack
        }//: Scroll
    }
}

#Preview {
    InsetGalleryView(animal: InsetGalleryView.animals[2])
        .previewLayout(.sizeThatFits)
        .padding()
}
