//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Denis Yaremenko on 31.03.2024.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    // MARK: - Properties
    let animal: Animal
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    AnimalGridItemView(animal: AnimalGridItemView.animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
